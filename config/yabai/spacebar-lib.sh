#!/bin/bash

output_device() {
  output="`SwitchAudioSource -c`"

  case "$output" in
    MacBook*)
      output="π MAC"
      ;;
    "MOPIP'Airpods Pro")
      output="π§ pro"
      ;;
    "MOPIP'AirPods")
      output="π§ pods"
      ;;
    "OPPO Enco Free2")
      output="π§ OPPO"
      ;;
  esac
  echo "$output"
}

volume() {
  volume=$(osascript -e 'output volume of (get volume settings)')
  [[ $volume = "0" ]] && volume="mute"
  echo "ο¨ ${volume}"
}

info() {
  echo "Mopip77"
}

ip() {
  osascript -e "IPv4 address of (system info)"
}

shurufa() {
  curPath=$(cd `dirname $0`; pwd)
  layout=$(${curPath}/get_current_shurufa)
  if [[ $layout == *"ABC"* ]];then
     echo "πΊπΈ "
  else
     echo "π¨π³ "
  fi
}

now_playing() {
    IFS=$'\n' read -r -d$'\1' isPlaying title <<< "$(nowplaying-cli get playbackRate title)"
    if [ "0" != "$isPlaying" ]; then
        echo "π» [$title]"
    fi
}
