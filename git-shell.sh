#!/bin/bash

git add -A;
date_time=`date '+%Y/%m/%d/%H:%M'`;
git commit -m "til追加 ${date_time}";
# git push -f origin master;
