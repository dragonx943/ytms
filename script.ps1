function ytms {
        $ytms_input = """$args[0]"""
        $ytms_url = yt-dlp --format ba --get-url --extractor-args youtube:player_client=android,web ytsearch1:$ytms_input
        $ytms_title = yt-dlp --get-title --extractor-args youtube:player_client=android,web ytsearch1:$ytms_input
        $ytms_uploader = yt-dlp --print "%(uploader)s" --extractor-args youtube:player_client=android,web ytsearch1:$ytms_input
        mpv --no-video --term-playing-msg="`r`nTiêu đề: $($ytms_title)`r`nNgười đăng tải: $($ytms_uploader)`r`n" $ytms_url
}
