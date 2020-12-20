# Browser

## Firefox

Firefox has some issues with webRTC calls and is not reliable in VPN mode. To [change](https://www.privacytools.io/browsers/#webrtc) this enter `about:config` in the firefox address bar and press enter, search for `media.peerconnection.enabled` and change it to false. 
To make shore every single WebRTC related setting is disabled change also `media.peerconnection.turn.disable` to `true`, `media.peerconnection.use_document_iceservers` to `false`, `media.peerconnection.video.enabled` to `false` and `media.peerconnection.identity.timeout` to `1`.

### Mouse
When using an external mouse firefox scrolling can be very slow, this is configuration issue.

Arch has some [documentation](https://wiki.archlinux.org/index.php/Firefox/Tweaks#Mouse_wheel_scroll_speed) to fix it.

TLDR
```
# about:config
# mousewheel.acceleration.start = -1
# mousewheel.acceleration.factor = 20 # default: 10 to 20
# mousewheel.default.delta_multiplier_y = 500 # default: 100 to 500
```