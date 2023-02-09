# Glyphs

The `fonts` directory contains font files, each of which is bundled into signed-distance-field glyph sets in PBF format that can be used for Mapbox styles.

The glyphs can be used with the following URL template:
`https://assets.arma.place/glyphs/{fontstack}/{range}.pbf`

You can read more about glyphs in the [mapbox style specification](https://docs.mapbox.com/mapbox-gl-js/style-spec/glyphs/).

## Contributing

### Adding a font

Simply add the TrueType font file to the `fonts` directory. The name of the font file corresponds to the name of the output glyph set.

## Building the glyphs

The npm package [`fontnik`](https://www.npmjs.com/package/fontnik) is used to build the glyphs. Therefore `npm` must be installed. Then simply run the following command to build all glyphs to the `./out` directory:

```sh
./build.sh ./out
```
