$files = Get-ChildItem -Filter *.html

foreach ($file in $files) {
    Write-Host "Processing $($file.Name)..."
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    $content = $content.Replace("Ã¡", "á")
    $content = $content.Replace("Ã©", "é")
    $content = $content.Replace("Ã³", "ó")
    $content = $content.Replace("Ãº", "ú")
    $content = $content.Replace("Ã±", "ñ")
    $content = $content.Replace("Ãš", "Ú")
    $content = $content.Replace("Ã‘", "Ñ")
    $content = $content.Replace("Ã ", "Á")
    $content = $content.Replace("Ã‰", "É")
    $content = $content.Replace("Ã“", "Ó")
    $content = $content.Replace("â‚¬", "€")
    $content = $content.Replace("âœ“", "✓")
    $content = $content.Replace("â† ", "←")
    $content = $content.Replace("ðŸŒ™", "🌙")
    $content = $content.Replace("â˜€ï¸ ", "☀️")
    $content = $content.Replace("â€¢", "•")
    $content = $content.Replace("Â©", "©")
    
    # Handle the tricky 'í'
    $i_accent = "Ã" + [char]0xad
    $content = $content.Replace($i_accent, "í")
    $content = $content.Replace("Ã­", "í")

    [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Done $($file.Name)"
}
