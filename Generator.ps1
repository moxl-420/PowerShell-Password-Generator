#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Pasword generator
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function pasword {
Write-Host "-----------------------------------------------------------------------------------------------------" -ForegroundColor DarkRed
#Maximum number of letters in pasword
$maxletters = 6

#Maximum totaal characters in pasword
$maxtotal = 8

# fill array with words shorter then $maxletters
$woorden = @(
  @("Staal"), @("Avond"), @("Auto"), @("Garage"), @("Hamer"), @("Radio"), @("Koud"), @("Warm"), @("Poedel"), @("Boom"), @("Kippen"), @("Fiets"), @("Hond"), @("Water"), @("Kraan"), @("Bank"), @("radio")
)

# Permitted special characters.
$charas = @(
  @("!"), @("$"), @("*")
)
#----------------------------------------------------------------------------------------------------------------

# Determine random index 
$i = Get-Random -Maximum $woorden.count
$i2 = Get-Random -Maximum $charas.count

#Define length of word.
$cijfer=$null
$word = $woorden[$i]
$wordcount = $word.ToCharArray().length
$special = $charas[$i2]

#check if procedure can pass
if ($wordcount -gt $maxletters){

#errormessage if not
write-host "word too long" -ForegroundColor red
}else{

#action when wordcount checks out
        #Cijfers bepalen
        $j = $maxtotal - $wordcount

        #Random number gen
            for ($k=0; $k -lt $j; $k++) {
            $rando=Get-Random -Maximum 9
            $cijfer="$cijfer$rando"
            }

        #put it all together
        $sapcijfer= $cijfer.Substring(0,$cijfer.Length-1)
        $passAD=  "$word$cijfer"
        $passSAP= "$word$sapcijfer$special"

        #output
        write-host "------------------------------------------------------"
        write-host ">   Paswoord Generator" -ForegroundColor DarkRed
        write-host "------------------------------------------------------"
        write-host "Pasword without special char: " $passAD
        write-host "Pasword with special char   : " $passSAP
        write-host "------------------------------------------------------"
}

}
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
