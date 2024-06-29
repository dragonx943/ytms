# ytms
ytms là 1 script trên Powershell, sử dụng [yt-dlp](https://github.com/yt-dlp/yt-dlp) để yêu cầu và phát nhạc từ kết quả tìm kiếm đầu tiên xuất hiện trên YouTube và sử dụng [mpv](https://github.com/mpv-player/mpv) để phát nhạc.

Note: ytms đã được confirm là hoạt động trên Windows, còn Linux / Mac thì chưa rõ. Mở vấn đề tại mục Issues của [tác giả gốc](https://github.com/Atrament1s/ytms/issues).

# Yêu cầu
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [mpv](https://github.com/mpv-player/mpv)
- [powershell](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.4)

# Cài đặt
Nếu bạn đã cài sẵn [yt-dlp](https://github.com/yt-dlp/yt-dlp) và [mpv](https://github.com/mpv-player/mpv) thì hãy chuyển sang bước kế tiếp. Nếu không, hãy cài mpv [tại đây](https://mpv.io/installation/) và yt-dlp [tại đây](https://github.com/yt-dlp/yt-dlp/wiki/Installation).

Cuối cùng là mở Powershell lên và gõ:

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/dragonx943/ytms/master/script.ps1 | Select-Object -ExpandProperty Content | Add-Content -Path $profile
```

# Sử dụng
Đơn giản: Nhập `ytms <query>`, trong đó `<query>` là Link YouTube / Tên bài nhạc. Nếu để rỗng - Tức là chỉ nhập `ytms` thì script sẽ bắt bạn nhập tên bài nhạc cần phát!
Note: Khi nhập Link, chỉ lấy đến đoạn trước dấu "&", nếu có chứa "&" thì Powershell sẽ từ chối thực hiện câu lệnh!

### Ví dụ 1
Nếu tôi muốn bật [Never Gonna Give You Up của Rick Ashley](https://www.youtube.com/watch?v=dQw4w9WgXcQ), thì đơn giản tôi chỉ cần nhập vào sau `ytms` là:
```powershell
ytms never gonna give you up
```

### Ví dụ 2
Nếu tôi muốn bật [Never Gonna Give You Up của Rick Ashley](https://www.youtube.com/watch?v=dQw4w9WgXcQ) nhưng lại muốn nó chọn đúng bài của Rick Ashley đăng tải, không phải video fake thì đơn giản tôi chỉ cần nhập vào sau `ytms` là:
```powershell
ytms Never Gonna Give You Up - Rick Ashley
```
### Ví dụ 3
Khi tôi muốn sử dụng Link Youtube để bật [Never Gonna Give You Up của Rick Ashley](https://www.youtube.com/watch?v=dQw4w9WgXcQ) thì đơn giản tôi chỉ cần nhập vào sau `ytms` là:
```powershell
ytms https://www.youtube.com/watch?v=dQw4w9WgXcQ
```

# Các phím tắt
Giống 100% phím tắt khi bạn sử dụng trình phát mpv, ví dụ:
  "Space (phím cách) / P" - Tiếp tục / Tạm dừng
  "M" - Mute / Tắt tiếng hoàn toàn
  "Q" - Thoát ytms
  "/" - Giảm âm lượng
  "*" - Tăng âm lượng
  "<-" - Tua ngược 5s
  "->" - Tua nhanh 5s
