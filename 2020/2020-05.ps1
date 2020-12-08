# Advent of code
# Jonathan Allen


$AOC = "C:\Scripts\PowerShell\AdventofCode"
sl $AOC
$One = Get-Content .\SourceData\20201205.txt


#region ### part 1 ####
# problem statement:


#endregion #######



#region ### part 2 ####

#endregion #######ert]::ToInt32($Seat,2)
    $Position = "$DRow - $DSeat"
    write-verbose "Position: $Position `t ID: $( ($DRow*8)+$DSeat)"
    If($Max -lt (($DRow*8)+$DSeat)){
        $Max = ($DRow*8)+$DSeat
    }
}
$Max

# bin to dec
#[convert]::ToInt32('111111',2)
# dec to bin
#[convert]::ToString(15,2)

#endregion #######



#region ### part 2 ####

#$Tickets = @('FBFBBFFRLR','BFFFBBFRRR','FFFBBBFRRR','BBFFBBFRLL')

$Seats = @()

foreach($Ticket in $Tickets){
    $Row = $Ticket.substring(0,7).replace('F', 0).replace('B',1)
    $Seat = $Ticket.substring(($ticket.length - 3),3).replace( 'R', 1).replace( 'L',0)

    $DRow = [convert]::ToInt32($Row,2)
    $DSeat = [convert]::ToInt32($Seat,2)
    $Position = "{0:D3};{1}" -f $DRow,$DSeat

    write-verbose "Position: $Position `t ID: $( ($DRow*8)+$DSeat)"
    If($Max -lt (($DRow*8)+$DSeat)){
        $Max = ($DRow*8)+$DSeat
    }
    $Seats += $Position
}

1..120|% {
    if($Seats[$_])    {
        $Row = $Seats -match "(^0|^00|'')$_;"
    }
    if($Row.Count -ne 8 -and $Row.count -ne 0){
        [int]$YourRow = $Row |%{($_-split ';')[0]}|select -Unique
        $FullRow = 0..7
        $SeatsInRow = $Row -split ' '
        $YourSeat = ($fullRow | compare ($SeatsInRow | % { ($_-split ';')[1]}) | where sideindicator -eq '=>').inputobject
        # ID = RowNo * 8 + SeatNo
        $SeatID = ($YourRow * 8 ) + $YourSeat
    }
}
"Your seat is : $SeatID"
#endregion #######
