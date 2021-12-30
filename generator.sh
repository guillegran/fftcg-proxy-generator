#!/bin/bash

cardlist=$1

function download_images() {

	language="eg" #Available languages: English (eg), German (de), Spanish (es), French (fr) and Italian (it).

	while read card; do
		url="https://fftcg.cdn.sewest.net/images/cards/full/$(echo "${card}")_$(echo "${language}").jpg"
		outfile="images/${card}_${language}.jpg"

		# skip already existing images
		[ -f "${outfile}" ] && continue

		wget -O "${outfile}" "${url}" 
	done
}

function generate_tex() {
	line_count=''

	while read card; do

		echo "\card{${card}_${language}}%"

		line_count="${line_count}I"
		if [ ${line_count} = 'III' ]; then
			line_count=''
			echo '\\[-0.34mm]'
		fi

	done

}

mkdir -p images
download_images < "$cardlist"
generate_tex < "$cardlist" > "tex/cards.tex"

tectonic -o . tex/proxies.tex # Tectonic compiler
# pdflatex -output-directory . tex/proxies.tex # PDFLaTeX compiler
