# /bin/sh
set -e

function usage {
    echo -e "Create spritesheets for for all sub-directories in script's parent directory"
    echo -e "Each directory will result in three spritesheets with ratios 1, 2 and 4."
    echo -e ""
    echo -e "\e[4m\e[1mUsage:\e[0m $0 <OUTPUT>"
    echo -e ""
    echo -e "\e[4m\e[1mArguments:\e[0m"
    echo -e "  <OUTPUT> Path of directory to write spritesheets to"
    exit 1
}

[ -z $1 ] && { usage; }

ratios=(1 2 4)

inDir=$(dirname $0)
outDir=$1

# ensure out dir exists and is empty
mkdir -p $outDir
rm -rf $outDir/*

for directory in $inDir/*/; do
    # we do not want to process $outDir
    if [ $directory -ef $outDir ]; then
        continue
    fi

    name=$(basename $directory)

    for ratio in ${ratios[*]}; do
        outName=$name
        if [ $ratio -ne 1 ]; then
            outName=$name@${ratio}x
            echo "📄 Building spritesheet \"$name\" (${ratio}x)"
        else
            echo "📄 Building spritesheet \"$name\""
        fi

        ./spreet --unique --minify-index-file --ratio $ratio $directory $outDir/$outName
    done
done