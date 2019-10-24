#!/bin/bash
export LAUNCHER_DIR=../launcher

export LAUNCHER_PLUGIN_DIR=$LAUNCHER_DIR/plugins
export LAUNCHER_JOB_FILE=run.sh
export LAUNCHER_SCHED=block
export LAUNCHER_PPN=56
export LAUNCHER_WORKDIR=`pwd`
export LAUNCHER_BIND=1

$LAUNCHER_DIR/paramrun

