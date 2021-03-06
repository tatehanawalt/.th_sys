#!/usr/bin/env zsh
#autoload

local thisbin=$0:A
local thisdir=$(dirname $thisbin)
local indir=$(pwd)

source $thisdir/config.zsh

local SRCPATH=$indir/src
local OUTPATH=$indir/out

# Parse cli args
local targets=()
local multilineoption=()
for i in $@; do
  case $i in
    --tag=*)
      multilineoption+=( ${i#*=} )
      ;;
    *)
      targets+=( $i )
      ;;
  esac
done

# Execute cli args
case ${targets[1]} in
  build) build_target $SRCPATH $OUTPATH ${targets[@]:1};;
  clean) clean_target $SRCPATH $OUTPATH ${targets[@]:1};;
  info)  info_target  $SRCPATH $OUTPATH ${targets[@]:1};;
  nix)   nix_target   $SRCPATH $OUTPATH ${targets[@]:1};;
  purge) purge_target $SRCPATH $OUTPATH ${targets[@]:1};;
  *)
    echo "target not recognized"
    echo "use:"
    echo "  build"
    echo "  clean"
    echo "  info"
    echo "  nix"
    echo "  purge"
    return 1
    ;;
esac
local result=$?

[ $result -ne 0 ] && echo "$result"
