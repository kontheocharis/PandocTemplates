LAYOUT='cat etc/before settings/layout'
DIR_NAME=$(basename "$PWD")
EXT_FORMAT=$(cat settings/format | head -n 1)
OUT_FORMAT=$(cat settings/format | tail -n 1)
ENGINE=$(cat settings/engine)
FILTERS=' '

if [ -s settings/filters ]
then
    FILTERS=$(cat settings/filters | awk '{print "--filter " $0}')
fi

pandoc $($LAYOUT) --pdf-engine=pdflatex \
       -t $OUT_FORMAT \
       --include-in-header etc/header-includes.tex \
       --include-in-header settings/header-includes.tex \
       -o "out/$DIR_NAME.$EXT_FORMAT" \
       $FILTERS
