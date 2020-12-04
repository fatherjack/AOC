# Advent of code
# Jonathan Allen


$AOC = "C:\Users\alljon\OneDrive - Quilter\Scripts\PowerShell\AdventofCode"
sl $AOC
$One = get-content .\SourceData\2020120101.txt


#### part 1 ####
# problem statement:
# find the pair of numbers that sum to 2020 and multiply them
# thought:
# for each item - subtract its value from 2020 and see if that value is in the sample set
foreach($i in $One){if((2020 - $i) -in $One){Write-Output "$I times $(2020 - $i) is $($(2020 - $i) * $I)";break}}


#### part 2 ####
# problem statement:
# find the trio  of numbers that sum to 2020 and multiply them
# thought:
# for each item  - subtract its value plus each value from a different set from 2020 and see if that value is in the sample set
$Gotit = $false
foreach($i in $One){
    if($Gotit){break}
    foreach($ii in $One){
        if($Gotit){break}
        if((2020 - $i - $ii) -in $One){
            Write-Output "$I times $ii times $(2020 - $i - $ii) is $($(2020 - $i - $ii) * $I * $ii)"
            $Gotit = $true
            break
        }
    }
}

