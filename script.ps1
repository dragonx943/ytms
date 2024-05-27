function ytms {
    param (
        [string]$ytms_input
    )

    if (-not $ytms_input) {
        $ytms_input = Read-Host "Nhập từ khóa tìm kiếm trên YouTube"
    }

    $ytms_url = yt-dlp --format ba --get-url --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input
    $ytms_title = yt-dlp --get-title --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input
    $ytms_uploader = yt-dlp --print "%(uploader)s" --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input

    mpv --no-video --term-playing-msg="`r`nTiêu đề: $($ytms_title)`r`nĐăng tải bởi: $($ytms_uploader)`r`n" $ytms_url
}
