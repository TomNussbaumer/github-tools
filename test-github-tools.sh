#!/bin/sh

export __DEBUG__=

if [ -n "$__DEBUG__" ]; then
  set -x
fi

__test__ () {
  local prefix1="$1"
  local prefix2="$2"
  local desc="$3"
  local cmd="$4"
  shift 4

  if [ -n "$__DEBUG__" ]; then
    $cmd "$@" #> /dev/null 2>&1 
  else
    $cmd "$@" > /dev/null 2>&1 
  fi
  if [ $? -eq 0 ]; then
    echo "[$prefix1] $desc"
  else
    echo "[$prefix2] $desc"
  fi
}

testEqualsZero () {
  local desc="$1"
  shift
  __test__ "PASS" "FAIL" "$desc" "$@"
}

testNotEqualsZero () {
  local desc="$1"
  shift
  __test__ "FAIL" "PASS" "$desc" "$@"
}

. ./github-tools-includes

[ -d tmp/TomNussbaumer ] && rm -rf tmp/TomNussbaumer
mkdir -p tmp/TomNussbaumer
cd tmp/TomNussbaumer

testEqualsZero "cloning of repo of valid user"      gh_clone github-tools
mkdir "invalid user"
cd "invalid user"
testNotEqualsZero "cloning of repo of an invalid user" gh_clone github-tools
cd ..
rm -rf "invalid user"

KNOWN_USERID="XXXHopefully-This-User-Will-Never-Be-On-GithubXXX"

testEqualsZero    "get info of valid user"              gh_user_json
testNotEqualsZero "get info of an invalid user"         gh_user_json $KNOWN_USERID
testEqualsZero    "get repos (json) of valid user"      gh_repos_json
testNotEqualsZero "get repos (json) of an invalid user" gh_repos_json $KNOWN_USERID
testEqualsZero    "get repos (url) of valid user"       gh_repos_urls
testNotEqualsZero "get repos (url) of an invalid user"  gh_repos_urls $KNOWN_USERID
testEqualsZero    "get repos (list) of valid user"      gh_repos
testNotEqualsZero "get repos (list) of an invalid user" gh_repos $KNOWN_USERID

cd ../..
rm -rf tmp


