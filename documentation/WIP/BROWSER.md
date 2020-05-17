# Browser

`Mi3 champions `pale moon` as default browser. To install Firefox run `sudo pacman -S firefox` or through software manager, same for any other browser.

Firefox has some issues with webRTC calls and is not reliable in VPN mode. To [change](https://www.privacytools.io/browsers/#webrtc) this enter `about:config` in the firefox address bar and press enter, search for `media.peerconnection.enabled` and change it to false. 
To make shore every single WebRTC related setting is disabled change also `media.peerconnection.turn.disable` to `true`, `media.peerconnection.use_document_iceservers` to `false`, `media.peerconnection.video.enabled` to `false` and `media.peerconnection.identity.timeout` to `1`.

When using an external mouse firefox scrolling can be very slow, it's possible to [change](https://wiki.archlinux.org/index.php/Firefox/Tweaks#Mouse_wheel_scroll_speed) this in `about:config` modifying `mousewheel.acceleration.start` to `-1`, `mousewheel.acceleration.factor` to the desired number (`10` to `20` are common values).
Mozilla's recommendation is to set `mousewheel.default.delta_multiplier_y` between `200` and `500` (default: `100`, adequate: `300`).

## Privacy
*[TODO](WIP/TODO.md) Update privacy and security, profiling and dots for it.

Details regarding configurations of firefox for privacy and security.

To install Firefox run `sudo pacman -S firefox` or through software manager, same for any other browser.