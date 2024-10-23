#!/bin/bash
EXTERNAL_OUTPUT="HDMI-A-1"

usage() {
  echo "Usage: ${0##./} [display] (left|right|horizontal)"
}

set_right() {
  # Set the Dell monitor as vertical
  wlr-randr --output ${1:?Specify the display} --transform 270 --pos 1920,0
  # Set it to the right of the main
  wlr-randr --output eDP-1 --pos 0,0
}

set_horizontal() {
  # Set the Dell monitor as vertical
  wlr-randr --output ${1:?Specify the display} --transform normal 
  # Set it to the right of the main
}

set_left() {
  # Set the Dell monitor as vertical
  wlr-randr --output ${1:?Specify the display} --transform 90 --pos 0,0
  # Set it to the left of the main
  wlr-randr --output eDP-1 --pos 1080,0
}

if [ $# -lt 2 ]; then
  usage
  exit 1
fi

if [[ $2 == "left" ]];then
  set_left "$1"
elif [[ $2 == "right" ]];then
  set_right "$1"
elif [[ $2 == "horizontal" ]];then
  set_horizontal "$1"
fi

