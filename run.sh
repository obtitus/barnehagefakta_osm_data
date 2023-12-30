#!/bin/bash

cd "${0%/*}"

make &> cron.log
