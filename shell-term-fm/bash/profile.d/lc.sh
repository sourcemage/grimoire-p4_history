#!/bin/bash
# Enhancing support for locale support
# First source the locale config then
# if a var is set set it...

. /etc/sysconfig/locale

if [[ -z $LANG ]]
then
  export LANG
fi

if [[ -z $LC_CTYPE ]]
then
  export LC_CTYPE
fi

if [[ -z $LC_NUMERIC ]]
then
  export LC_NUMERIC
fi

if [[ -z $LC_TIME ]]
then
  export LC_TIME
fi

if [[ -z $LC_COLLAT ]]
then
  export LC_COLLAT
fi

if [[ -z $LC_MONETARY ]]
then
  export LC_MONETARY
fi

if [[ -z $LC_MESSAGES ]]
then
  export LC_MESSAGES
fi

if [[ -z $LC_PAPER ]]
then
  export LC_PAPER
fi

if [[ -z $LC_NAME ]]
then
  export LC_NAME
fi

if [[ -z $LC_ADDRESS ]]
then
  export LC_ADDRESS
fi

if [[ -z $LC_TELEPHONE ]]
then
  export LC_TELEPHONE
fi

if [[ -z $LC_MEASUREMENT ]]
then
  export LC_MEASUREMENT
fi

if [[ -z $LC_ALL ]]
then
  export LC_ALL
fi
