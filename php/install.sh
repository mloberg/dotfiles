#!/usr/bin/env bash
#
# Install some PHP versions

phenv="$(dirname $0)/../bin/phenv"

$phenv install 70
$phenv install 71

$phenv switch 71
