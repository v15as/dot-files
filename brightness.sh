#! /usr/bin/bash


brightness=$(xbacklight -get)


if [ $(echo "$brightness > 10" | bc -l) -eq 1 ]; then
  $(xbacklight -dec 5)
fi
