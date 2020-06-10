# h264 (native) -> h264 (h264_qsv)
```
ffmpeg -init_hw_device qsv=hw -filter_hw_device hw -i ./video1.mp4 -vf hwupload=extra_hw_frames=64,format=qsv -vcodec h264_qsv -acodec copy -y ./trans_h264_qsv.mp4
```

# h264 (h264_qsv) -> h264 (h264_qsv)
```
ffmpeg -hwaccel qsv -vcodec h264_qsv -i ./video1.mp4 -vcodec h264_qsv -acodec copy -y ./trans_h264_qsv.mp4
```

# h264 (native) -> hevc (hevc_qsv)
```
ffmpeg -init_hw_device qsv=hw -filter_hw_device hw -i ./video1.mp4 -vf hwupload=extra_hw_frames=64,format=qsv -vcodec hevc_qsv -load_plugin hevc_hw -acodec copy -y ./trans_hevc_qsv.mp4

[AVHWFramesContext @ 0x184bec0] Unsupported format: pal8.
[AVHWFramesContext @ 0x184b980] Error initializing a child frames context
[AVHWFramesContext @ 0x184b980] Error creating an internal frame pool
[hevc_qsv @ 0x7a18c0] Error initializing a frames context for an internal frame allocation request
```

# h264 (h264_qsv) -> hevc (hevc_qsv))
```
ffmpeg -hwaccel qsv -vcodec h264_qsv -i ../video1.mp4 -vcodec hevc_qsv -acodec copy -y ./out.mp4

[AVHWFramesContext @ 0x184bec0] Unsupported format: pal8.
[AVHWFramesContext @ 0x184b980] Error initializing a child frames context
[AVHWFramesContext @ 0x184b980] Error creating an internal frame pool
[hevc_qsv @ 0x7a18c0] Error initializing a frames context for an internal frame allocation request
```

# hevc (hevc_qsv) -> hevc (hevc_qsv)
```
ffmpeg -hwaccel qsv -vcodec hevc_qsv -i ../hevc.mp4 -vcodec hevc_qsv -acodec copy -y ./out.mp4

[AVHWFramesContext @ 0x2bddac0] Unsupported format: pal8.
[AVHWFramesContext @ 0x2bdd080] Error initializing a child frames context
[AVHWFramesContext @ 0x2bdd080] Error creating an internal frame pool
[hevc_qsv @ 0x2422940] Error initializing a frames context for an internal frame allocation request
```

# h264 (native) -> hevc (libx265)
```
ffmpeg -i ./video1.mp4 -vcodec libx265 -acodec copy -y ./trans_h265.mp4
``` 

# hevc (hevc_qsv) -> h264 (h264_qsv)
```
ffmpeg -hwaccel qsv -vcodec hevc_qsv -i ../hevc.mp4 -vcodec h264_qsv -acodec copy -y ./out.mp4
```
 
# h264 (h264_qsv) -> hevc (libx265)
```
ffmpeg -hwaccel qsv -init_hw_device qsv=hw -filter_hw_device hw -vcodec h264_qsv -i ../video1.mp4  -vf hwupload=extra_hw_frames=64 -vcodec libx265 -acodec copy -y ./out_2.mp4

Impossible to convert between the formats supported by the filter 'Parsed_hwupload_0' and the filter 'auto_scaler_0'
Error reinitializing filters!
Failed to inject frame into filter network: Function not implemented
Error while processing the decoded data for stream #0:0
``` 

# vp8 (native) -> vp8 (vp8_vaapi)
```
ffmpeg -init_hw_device vaapi=intel:/dev/dri/renderD128 -hwaccel vaapi -hwaccel_output_format vaapi -hwaccel_device intel -i ./in.webm -filter_hw_device intel -vf 'format=vaapi,hwupload' -c:v vp8_vaapi -b:v 1M -maxrate 1M -c:a copy -y ./out.webm
```

# vp8 (native) ->  h264 (h264_qsv)
```
ffmpeg
```

# vp8 (vp8_qsv) -> h264 (h264_qsv)
```
ffmpeg -v verbose -hwaccel qsv -c:v vp8_qsv -i ./in.webm -c:v h264_qsv -b:v 1M -maxrate 1M  -y ./out.mp4
```

# vp8 (vp8_qsv) -> vp8 (vp8_vaapi)
```
ffmpeg
```
