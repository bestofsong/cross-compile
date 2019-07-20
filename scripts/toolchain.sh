#!/bin/bash

function get_sdk_path() {
  platform=${1:-iphoneos}
  ret=$(xcodebuild -showsdks -json | \
    jq -r "map(select(.platform == \"${platform}\")) | sort_by(.sdkVersion|tonumber) | .[-1] | .sdkPath")
  echo $ret
}

# get_sdk_path iphoneos
# get_sdk_path iphonesimulator
# get_sdk_path macosx
