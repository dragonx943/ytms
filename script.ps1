function ytms {
    param (
        [string]$ytms_input
    )

    Write-Host "Input: $ytms_input"

    if ($ytms_input -match '^https?://(www\.)?youtube\.com/watch\?v=') {
        $ytms_url_cmd = "yt-dlp --format ba --get-url $ytms_input"
        $ytms_title_cmd = "yt-dlp --get-title $ytms_input"
        $ytms_uploader_cmd = "yt-dlp --print '%(uploader)s' $ytms_input"
    } else {
        $ytms_url_cmd = "yt-dlp --format ba --get-url --extractor-args youtube:player_client=android,web ytsearch1:$ytms_input"
        $ytms_title_cmd = "yt-dlp --get-title --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input"
        $ytms_uploader_cmd = "yt-dlp --print '%(uploader)s' --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input"
    }

    $ytms_url = Invoke-Expression $ytms_url_cmd
    $ytms_title = Invoke-Expression $ytms_title_cmd
    $ytms_uploader = Invoke-Expression $ytms_uploader_cmd

    Write-Host "URL: $ytms_url"
    Write-Host "Title: $ytms_title"
    Write-Host "Uploader: $ytms_uploader"

    mpv --no-video --term-playing-msg="`r`nTitle: $ytms_title`r`nUploader: $ytms_uploader`r`n" $ytms_url
}
