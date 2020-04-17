#!/usr/bin/env python3

import os,sys

from fabric.api import run, cd, env
from pprint import pprint

# configuration

env.shell = '/bin/sh -l -c'
env.user = 'root'
env.password = '123456'
env.hosts = ['root@192.168.99.250']


def update_binary():
  with cd('/overlay'):
    run("pwd")
    run('./refresh_binary.sh')
