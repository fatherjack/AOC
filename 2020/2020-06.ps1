#region ####### setup #######
if ($env:USERNAME -ne 'Jonathan')
{
    $AOC = "C:\Scripts\PowerShell\AdventofCode"
    Set-Location $AOC
    $RawAnswerss = New-Object System.IO.StreamReader("$AOC\20201204.txt") }

$Answers = $Answerss = @()
while (-not $RawAnswerss.EndOfStream) {
    $Line = $null
    $L = $RawAnswerss.ReadLine()
    if ($L -ne '') {
        $line += $L -split ' '
        $Answers += $line
    }
    else {
        $Answerss += , $Answers
        $Answers = @()
    }
}