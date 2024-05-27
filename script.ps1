function ytms {
    param (
        [string]$ytms_input
    )

    # In đầu vào để debug
    Write-Host "Input: $ytms_input"

    if ($ytms_input -match '^https?://(www\.)?youtube\.com/watch\?v=') {
        # Nếu $ytms_input là một URL
        Write-Host "Processing as URL"
        $ytms_url_cmd = "yt-dlp --format ba --get-url '$ytms_input'"
        $ytms_title_cmd = "yt-dlp --get-title '$ytms_input'"
        $ytms_uploader_cmd = "yt-dlp --print '%(uploader)s' '$ytms_input'"
    } else {
        # Nếu $ytms_input là một từ khóa tìm kiếm
        Write-Host "Processing as search query"
        $ytms_url_cmd = "yt-dlp --format ba --get-url --extractor-args youtube:player_client=android,web ytsearch1:'$ytms_input'"
        $ytms_title_cmd = "yt-dlp --get-title --extractor-args youtube:player_client=ios,web ytsearch1:'$ytms_input'"
        $ytms_uploader_cmd = "yt-dlp --print '%(uploader)s' --extractor-args youtube:player_client=ios,web ytsearch1:'$ytms_input'"
    }

    # Thực thi các lệnh và lấy kết quả
    Write-Host "Running URL command: $ytms_url_cmd"
    $ytms_url = Invoke-Expression $ytms_url_cmd
    Write-Host "Running Title command: $ytms_title_cmd"
    $ytms_title = Invoke-Expression $ytms_title_cmd
    Write-Host "Running Uploader command: $ytms_uploader_cmd"
    $ytms_uploader = Invoke-Expression $ytms_uploader_cmd

    # In kết quả để debug
    Write-Host "URL: $ytms_url"
    Write-Host "Title: $ytms_title"
    Write-Host "Uploader: $ytms_uploader"

    # Kiểm tra nếu URL hợp lệ trước khi chạy mpv
    if ($ytms_url) {
        mpv --no-video --term-playing-msg="`r`nTitle: $ytms_title`r`nUploader: $ytms_uploader`r`n" $ytms_url
    } else {
        Write-Host "Error: Could not retrieve a valid URL."
    }
}
