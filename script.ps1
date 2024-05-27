function ytms {
    $ytms_input = """$args[0]"""

    if ($ytms_input -match '^https?://(www\.)?youtube\.com/watch\?v=') {
        # Nếu $ytms_input là một URL
        $ytms_url = yt-dlp --format ba --get-url $ytms_input
        $ytms_title = yt-dlp --get-title $ytms_input
        $ytms_uploader = yt-dlp --print "%(uploader)s" $ytms_input
    } else {
        # Nếu $ytms_input là một từ khóa tìm kiếm
        $ytms_url = yt-dlp --format ba --get-url --extractor-args youtube:player_client=android,web ytsearch1:$ytms_input
        $ytms_title = yt-dlp --get-title --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input
        $ytms_uploader = yt-dlp --print "%(uploader)s" --extractor-args youtube:player_client=ios,web ytsearch1:$ytms_input
    }

    mpv --no-video --term-playing-msg="`r`nTitle: $($ytms_title)`r`nUploader: $($ytms_uploader)`r`n" $ytms_url
}
