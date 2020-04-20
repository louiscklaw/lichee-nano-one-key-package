#!/usr/bin/env bash

set -ex

cd overlay
  python -m SimpleHTTPServer 8000

cd -