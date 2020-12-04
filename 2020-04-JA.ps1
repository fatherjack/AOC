#region ####### setup #######
$AOC = "C:\Users\alljon\OneDrive - Quilter\Scripts\PowerShell\AdventofCode"
Set-Location $AOC
$RawPassports = New-Object System.IO.StreamReader("$AOC\20201204.txt")

$Passport = $Passports = @()
while(-not $RawPassports.EndOfStream){
    $Line = $null
    $L = $RawPassports.ReadLine()
    if($L -ne ''){
        $line += $L -split ' '
        $Passport += $line
    }
    else{
        $Passports += ,$Passport
        $Passport = @()
    }
}

$RawPassports.Dispose()
#endregion ##########
#region ###### Part 1 #########
$good = $Bad = 0
foreach ($Passport  in $Passports) {
[int]$c = 0
        switch -regex ($Passport) {
            '.*byr.*'{$c++}
            '.*iyr.*'{$c++}
            '.*eyr.*'{$c++}
            '.*hgt.*'{$c++}
            '.*hcl.*'{$c++}
            '.*ecl.*'{$c++}
            '.*pid.*'{$c++}
            # '.*cid.*'{We dont add a value for CID as it is optional}
        }
    if($c -ge 7){
        $Good ++
    }
    else{
        $Bad ++
    }
}
$Bad # 63
$Good # 190
#endregion ######

#region ###### Part 2 #########

[int]$I = $good = $Bad = 0
[int]$debug = 0
foreach ($Passport  in $Passports) {
[int]$c = 0
        switch -regex ($Passport) {
            '.*byr.*'{
                $byr = (($Passport -like "*byr*") -split ':')[1]
                if(($byr -ge 1920 -and $byr -le 2002) -and ($byr -match '\d{4}')){$c++}
            }
            '.*iyr.*'{
                $iyr = (($Passport -like "*iyr*") -split ':')[1]
                if(($iyr -ge 2010 -and $iyr -le 2020) -and ($iyr -match '\d{4}')){$c++}
            }
            '.*eyr.*'{
                $eyr = (($Passport -like "*eyr*") -split ':')[1]
                if(($eyr -ge 2020 -and $eyr -le 2030) -and ($eyr -match '\d{4}')){$c++}
            }
            '.*hgt.*'{
                $hgt = (($Passport -like "*hgt*") -split ':')[1]
                $hgtc = ($hgt -replace 'cm')
                $hgti = ($hgt -replace 'in')
                if( ($hgt -match '.*cm.*') -and ($hgtc -ge 150 -and $hgtc -le 193 ) ){$c++}
                elseif( ($hgt -match '.*in.*') -and ($hgti -ge 59 -and $hgtc -le 76 ) ){$c++}
            }
            '.*hcl.*'{
                $hcl = (($Passport -like "*hcl*") -split ':')[1]
                if($hcl -match '^#[0-9|a-f]{6}'){$C++}
            }
            '.*ecl.*'{
                $ecl = (($Passport -like "*ecl*") -split ':')[1]
                if($ecl -match 'amb|blu|brn|gry|grn|hzl|oth'){$c++}
            }
            '.*pid.*'{
                $p_id = (($Passport -like "*pid*") -split ':')[1]
                if($p_id -match '[0-9]{9}'){$c++}
            }
            # '.*cid.*'{We dont add a value for CID as it is optional}
        }
    if($c -ge 7){
        $Good ++
        if($I -lt $debug){
            "$passport"
            "$byr"
            "$iyr"
            "$eyr"
            "$hgt"
            "$hcl"
            "$ecl"
            "$p_id"
            "$c"
            $i++
        }
    }
    else{
        $Bad ++
    }
}
$Good
$Bad
