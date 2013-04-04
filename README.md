# Marker Generator

Tool for creating gorgeous markers that fit in with [Mapbox's Marker
style](http://mapbox.com/blog/markers/)

The style is simple icons (ala [Maki](http://mapbox.com/maki/)) overlayed on
top of a pin with a drop shadow. These pins are then tinted to the desired color.

For now I'm supporting static colors (see `render.sh`) only.

Requires:

* ImageMagick
* Bash >= 4.0

Inkscape is useful for editing the SVGs

**Usage**

```bash
    $ git clone <repo>
    $ make
    $ rsync -vr renders/* your_server:/path
```

**Sources**

```
/
  icons/    # icon sources
  pins/     # icons overlayed on the pin marker
  renders/  # the rendered PNGs
  render.sh # script that renders all svgs in the pins/ directory
```

Colors and sizes can be customized in `render.sh`

