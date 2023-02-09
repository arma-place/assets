# Spritesheets

This directory contains several subdirectories, each of which is bundled into a separate spritesheet.  
E.g. icons contained in the subdirectory `default` are bundled in the spritesheet `https://assets.arma.place/sprites/default`.

You can read more about spritesheet in the [mapbox style specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/sprite/).

## Contributing

### Adding a spritesheet

To add a entirely new spritesheet, simply create a new subdirectory next to this README.

Refer to the [_Adding a sprite_-Section](#adding-a-sprite) on how to add sprites to your new spritesheet.

### Adding a sprite

Sprites are added as SVG files, which are usually square and have a size of 64 x 64 pixels.  
Although this aspect ratio and size is not a hard limitation, it is recommended to adhere to those values to avoid issues while generating the spritesheets.

To add a single sprite, simply add the SVG file with the desired name in the directory.

It is possible to divide sprites into categories, by adding them in sub-directories of your spritesheet directory. For example, the file `default/locations/rockarea.svg` will be accessible in the spritesheet `default` as `locations/rockarea`.

At the moment it is not possible to add sprites with `content`, `stretchX` and `stretchY` properties.

## Building the spritesheets

[`spreet`](https://github.com/flother/spreet) is used to build the spritesheets.

Simply run the following command to build all spritesheets to the `./out` directory:

```sh
./build.sh ./out
```
