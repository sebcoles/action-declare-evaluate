#!/bin/bash
/declare/Veracode.OSS.Declare evaluate -f $1 2>&1 | tee declare.log
if grep -q FATAL declare.log; then
  exit 1
fi
if grep -q "[Policy][Compliance Status] Did Not Pass" declare.log; then
  exit 1
fi