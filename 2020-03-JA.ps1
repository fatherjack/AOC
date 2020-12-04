############# Set up #############
$AOC = "C:\Users\alljon\OneDrive - Quilter\Scripts\PowerShell\AdventofCode"
Set-Location $AOC
[System.Collections.ArrayList]$Data = get-content .\20201203.txt
$Test = get-content .\20201203_test.txt
$Test = get-content .\20201203_jp.txt

#   $Data = $Test
#region ####### Part 1 ########
$x=0;$y=0;$count=0;$StrArray=@()
for($r = 0; $r -lt $Data.Count; $r++) {
    $x ++  # keep count of current row
    $y += 3 # move 'right' 3 spaces

    $Str = $Data[$x]*200

    if($str.Substring($y,1) -eq '#'){
        #Write-Output "$x : $y - $($str.Substring($y,1))"
        $count ++
    }
}
$count
#endregion

#region ####### Part 2 ########

#Slope 1:1 - 50 
#Slope 1:3 - 148
#Slope 1:5 - 53
#Slope 1:7 - 64
#Slope 2:1 - 29

$x=0;$y=0;$count=0;$StrArray=@()
# for 'drop' part of slope alter the stepping in the loop
for($r = 0; $r -le $Data.Count; $r+=2) {
    $x +=2 # keep count of current row
    $y ++ # for 'right' part of slope alter value here

    $Str = $Data[$x]*200

    if($str.Substring($y,1) -eq '#'){
        #Write-Output "$r : $x : $y - $($str.Substring($y,1))"
        $count ++
    }
    else{
        #Write-Output "$r : $x : $y - $($str.Substring($y,1))"
    }
}

$count

#   50*148*53*64*29=   727923200
