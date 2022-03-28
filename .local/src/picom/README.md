picom
=======

You'll find tryone's dual_kawase blur for the backend, as well as rounded corners from sdhand if they are so desired, merged from ibhagwan.

![](demo.gif)

This is a forked version from jonaburg's picom branch, including Blackcapcoder's animation code inside. The animations here are further smoothed and time deltas reduced.

You'll need to run it with the experimental backend with:
`picom --experimental-backend`

Your picom config can also now take advantage of some of these options:
- [x] * `transition-length`   length of animation in milliseconds  (default: 500)
- [x] * `transition-pow-x`    animation easing on the x-axis (default: 0.15)
- [x] * `transition-pow-y`    animation easing on the y-axis (default: 0.15)
- [x] * `transition-pow-w`    animation easing on the window width  (default: 0.15)
- [x] * `transition-pow-h`    animation easing on the window height (default: 0.15)
- [x] * `size-transition`     whether to animate window size changes (default: true)
- [ ] * `spawn-center-screen` whether to animate new windows from the center of the screen (default: false)
- [ ] * `spawn-center`        whether to animate new windows from their own center (default: true)
- [ ] * `no-scale-down`       Whether to animate down scaling (some programs handle this poorly) (default: false)

----
## Why The Fork??

This is forked from the original jonaburg Picom because the regular picom port for OpenBSD is fine, but lacking the sweet features present here. 

Also I want to provide a good reliable place to come and find out how to build a custom version of picom for new OpenBSD users. Hope you find it helpful!

### `--experimental-backends`

This flag enables the refactored/partially rewritten backends. (IT'S REQUIRED).

## Build

### Dependencies

Assuming you already have all the usual building tools installed (e.g. gcc, python, meson, ninja, etc.), you still need:

* uthash
* libconfig
* libev

### To build

```bash
git clone https://gitlab.com/Zaney/picom
cd picom
LDFLAGS="-L/usr/local/lib -L/usr/X11R6/lib -I/usr/X11R6/include" CPPFLAGS="-I/usr/local/include" meson --buildtype=release . build
ninja -C build
```

Built binary can be found in `build/src`

If you have libraries and/or headers installed at non-default location (e.g. under `/usr/local/`), you might need to tell meson about them, since meson doesn't look for dependencies there by default.

### To install

``` bash
$ ninja -C build install
```

Default install prefix is `/usr/local`, you can change it with `meson configure -Dprefix=<path> build`
