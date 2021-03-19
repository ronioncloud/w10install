@echo off

IF %1.==. GOTO USAGE

git add .
git commit -a -m %1
git push
GOTO END

:USAGE
echo "usage: %0 <git commit message>"
  
:END

