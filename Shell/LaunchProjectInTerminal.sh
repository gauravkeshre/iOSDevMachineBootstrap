#!/bin/sh

set -e

if [ -n "$XcodeProjectPath" ]; then
  open -a Terminal "$XcodeProjectPath"/..
else
  open -a Terminal "$XcodeWorkspacePath"/..
fi