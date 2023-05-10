# /bin/sh
set -e

function usage {
    echo -e "Create signed-distance-field glyph sets in PBF format for"
    echo -e "all fonts in \"$(dirname $0)/fonts/\"."
    echo -e ""
    echo -e "\e[4m\e[1mUsage:\e[0m $0 <OUTPUT>"
    echo -e ""
    echo -e "\e[4m\e[1mArguments:\e[0m"
    echo -e "  <OUTPUT> Path of directory to write glyphs to"
    exit 1
}

[ -z $1 ] && { usage; }

inDir=$(dirname $0)/fonts
outDir=$1

# ensure out dir exists and is empty
mkdir -p $outDir
rm -rf $outDir/*

for fontFile in $inDir/*.ttf; do
    fileName=$(basename $fontFile)
    name="${fileName%.*}"

    # ensure font-directory exists
    mkdir -p $outDir/$name

    echo "🔠 Building glyphs \"$name\""
    npm exec --yes --package=fontnik@0.7.2 build-glyphs $fontFile $outDir/$name
done
