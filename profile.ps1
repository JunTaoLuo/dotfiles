# Imports
Import-Module PSReadLine

# Load posh-git example profile
. 'C:\Users\johluo\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

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

# git
function gitmt {
    git mergetool -t p4merge
}

# misc
function pro {
    vim $profile
    $profile
}
