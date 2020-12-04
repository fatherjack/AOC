
############# Set up #############
$AOC = "C:\Users\alljon\OneDrive - Quilter\Scripts\PowerShell\AdventofCode"
Set-Location $AOC
$Data = get-content .\SourceData\20201202.txt

############# Part 1 #############
$Total=0
foreach($row in $data){
    # Get value
    $Code, $char, $pwd = $row -split ' '
    [int]$Min, [int]$Max = $code -split '-'
    # Test pwd
    [int]$C=0
    if(($pwd.GetEnumerator()|Where-Object {$_ -eq ($char -replace ':')}).count -in ($min..$max)){
        $c++
    }
    $Total += $c
}
Write-Output "Day 02, question 1 answer is: $Total"


############# Part 2 #############

$Total=0
foreach($row in $data){
    # Get value
    $Code, $char, $pwd = $row -split ' '
    [int]$First, [int]$Last = $code -split '-'

    # Test pwd
    [int]$C=0

    $p = @($pwd.GetEnumerator())
    # need to -1 on Min and Max as the puzzle uses 1-based arrays
    # using -xor - a binary comparison that ensures one or the other but not both sides is true
    if(($p[$first-1] -eq ($char -replace ':')) -xor ($p[$last-1] -eq ($char -replace ':'))){
        Write-verbose "PASS: MIN $p[$($first-1)]; MAX $p[$($last-1)]"
        $c++
    }
    else{
        Write-verbose "FAIL: MIN $p[$($first+1)]; MAX $p[$($last+1)]"
    }

    $Total += $c
}
Write-Output "Day 02, question 2 answer is: $Total"
