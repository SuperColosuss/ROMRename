# Root folder for all roms stored in a string array, sorted ny name
[string[]]$ALLGames = (Get-ChildItem -LiteralPath "C:\Users\the_i\OneDrive\Desktop\Roms\" -Recurse -Name)
$ALLGamesPATH = "C:\Users\the_i\OneDrive\Desktop\Roms\" 
$regexPatternA = '.\(.*\]' # Pattern matching "(something) [something]"
$regexPatternB = '.\(.*\)' # Pattern matching "(something)"
$regexPatternC = '.\[.*\]' # Pattern matching "[something]"
$regexPatternD = '.\#.*\A' # Pattern matching " # GBA"
$DoNotRename = @(".xml", ".dir", ".txt", ".zip") # Array of objects that script will not rename

foreach ($game in $ALLGames) {
    $NewName = ($ALLGamesPATH + $game) # Path of game + game name
    if ($game -match $DoNotRename) {
        continue
    }
    elseif ($game -match $regexPatternA) {
        Move-Item -LiteralPath ($ALLGamesPATH + $game) -Destination ($NewName -replace $regexPatternA, '')
    }
    elseif ($game -match $regexPatternB) {
        Move-Item -LiteralPath ($ALLGamesPATH + $game) -Destination ($NewName -replace $regexPatternB, '')
    }
    elseif ($game -match $regexPatternC) {
        Move-Item -LiteralPath ($ALLGamesPATH + $game) -Destination ($NewName -replace $regexPatternC, '')
    }
    elseif ($game -match $regexPatternD) {
        Move-Item -LiteralPath ($ALLGamesPATH + $game) -Destination ($NewName -replace $regexPatternD, '')
    }
    else {
        Write-Host "$game does not need to be renamed" -ForegroundColor Yellow
    }
}
