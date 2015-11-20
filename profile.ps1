
# Load posh-git example profile
. 'C:\Users\johluo\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

# envars
$subuser="C:\Users\johluo\AppData\Roaming\Sublime Text 3\Packages\User"

# cds
function up2 {
    cd ../..
}
function up3 {
    cd ../../..
}
function up4 {
    cd ../../../..
}
function up5 {
    cd ../../../../..
} 
function cdg {
    cd C:\gh
}
function cdsubl {
    cd $subuser
}

# build
function btool {
    cd src/Microsoft.Dnx.Tooling
    dnu build
    cd ../..
}
function bruntime {
    cd src/Microsoft.Dnx.Runtime
    dnu build
    cd ../..
}
function bcomp {
    cd src/Microsoft.Dnx.Compilation
    dnu build
    cd ../..
}

# test
function ttooling {
    cd test/Microsoft.Dnx.Tooling.FunctionalTests
    dnvm run 1.0.0-dev test
    cd ../..
}
function tpublishnormalize {
    cd test/Microsoft.Dnx.Tooling.FunctionalTests
    dnvm run 1.0.0-dev test -method "Microsoft.Dnx.Tooling.FunctionalTests.DnuPublishTests.DnuPublishConsoleAppWithNoSourceOptionNormalizesVersionNumber"
    cd ../..
}
function tpublish {
    cd test/Microsoft.Dnx.Tooling.FunctionalTests
    dnvm run 1.0.0-dev test -class "Microsoft.Dnx.Tooling.FunctionalTests.DnuPublishTests"
    cd ../..
}
function tpackadd {
    cd test/Microsoft.Dnx.Tooling.FunctionalTests
    dnvm run 1.0.0-dev test -class "Microsoft.Dnx.Tooling.DnuPackagesAddTests"
    cd ../..
}

# functions
function subl ($file) {
    subl.exe $file
}
function pro {
    vim $profile; .$profile
}
function ll
{
    param ($dir = ".", $all = $false)
 
    $origFg = $Host.UI.RawUI.ForegroundColor
    if ( $all ) { $toList = ls -force $dir }
    else { $toList = ls $dir }
 
    foreach ($Item in $toList)
    {
        Switch ($Item.Extension)
        {
            ".exe" {$Host.UI.RawUI.ForegroundColor="DarkYellow"}
            ".hta" {$Host.UI.RawUI.ForegroundColor="DarkYellow"}
            ".cmd" {$Host.UI.RawUI.ForegroundColor="DarkRed"}
            ".ps1" {$Host.UI.RawUI.ForegroundColor="DarkGreen"}
            ".html" {$Host.UI.RawUI.ForegroundColor="Cyan"}
            ".htm" {$Host.UI.RawUI.ForegroundColor="Cyan"}
            ".7z" {$Host.UI.RawUI.ForegroundColor="Magenta"}
            ".zip" {$Host.UI.RawUI.ForegroundColor="Magenta"}
            ".gz" {$Host.UI.RawUI.ForegroundColor="Magenta"}
            ".rar" {$Host.UI.RawUI.ForegroundColor="Magenta"}
            Default {$Host.UI.RawUI.ForegroundColor=$origFg}
        }
        if ($item.Mode.StartsWith("d")) {$Host.UI.RawUI.ForegroundColor="Gray"}
        $item
    }
    $Host.UI.RawUI.ForegroundColor = $origFg
}
function tail ($file) {
    Get-Content $file -Wait
}
function whoami {
    [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
}
