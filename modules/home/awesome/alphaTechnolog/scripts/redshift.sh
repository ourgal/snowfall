#!/usr/bin/env bash

cache_file=$HOME/.cache/awesomewm/services/redshift_state

initial_hook() {
  if [ ! -d $(dirname $cache_file) ]; then
    mkdir -p $(dirname $cache_file)
  fi
  if [ ! -f $cache_file ]; then
    echo off >$cache_file
  fi
}

get_state() {
  # check if redshift is running
  cat $cache_file
}

restore() {
  local state=$(get_state)
  if [[ $state == "on" ]]; then
    enable_redshift
  else
    disable_redshift
  fi
}

disable_redshift() {
  redshift -x 2>&1 >/dev/null
  # saving state
  echo off >$cache_file
}

enable_redshift() {
  redshift -x 2>&1 >/dev/null
  redshift -O 5000 2>&1 >/dev/null
  # saving new state
  echo on >$cache_file
}

toggle() {
  local state=$(get_state)
  if [[ $state == "on" ]]; then
    disable_redshift
  else
    enable_redshift
  fi
}

initial_hook

if [[ $1 == "state" ]]; then
  get_state
fi

if [[ $1 == "enable" ]]; then
  enable_redshift
fi

if [[ $1 == "disable" ]]; then
  disable_redshift
fi

if [[ $1 == "toggle" ]]; then
  toggle
fi

if [[ $1 == "restore" ]]; then
  restore
fi
