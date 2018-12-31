#!/bin/bash

montage parallax.png parallax-simple.png -geometry +0+0 -borderwidth 50 -bordercolor white proef.png
convert -trim proef.png parallax-figure.png
rm proef.png
