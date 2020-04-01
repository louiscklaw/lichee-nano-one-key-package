#!/usr/bin/env python3

import os,sys
from fabric.api import local, run

def test():
    run("/bin/id")
