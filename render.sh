#!/bin/bash

declare -A colors
declare -A sizes

colors=(
    ["red"]='#f63a39'
    ["orange"]='#ff793d'
    ["yellow"]='#ffc84e'
    ["green"]='#71bc4e'
    ["gray"]='#505050'
    ["cyan"]='#00bcce'
    ["blue"]='#5b8dd3'
    ["purple"]='#b776bb'
    ["pink"]='#f56098'
    ["lgray"]='#748288'
)

sizes=(
    ["l"]='35'
    ['m']='30'
    ['s']='20'
)

OUTDIR=renders

function render() {
    local color=$1
    local size=$2
    local in=$3
    local out=$4
    local args="-antialias -background transparent -resize "$size" -fill $color -tint 100% $in $out"
    convert $args
}

# for every pin and every size and every color
# discriminate not
for pin in `find pins/ -name '*svg*'`; do
    for size in "${!sizes[@]}"; do
        for color in "${!colors[@]}"; do
            file=$(basename "$pin")
            name="${file%.*}-$size-$color.png"
            render ${colors["$color"]} ${sizes["$size"]} $pin $OUTDIR/$name
        done
    done
done

