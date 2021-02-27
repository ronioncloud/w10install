@echo off

set EXE=..\software\adk-setup.exe

if NOT EXIST %EXE% (
  echo ERROR: %EXE% not found!
  exit /b
)

echo ####### %0 #######

echo installing Microsoft ADK deployment tools ...
%EXE% /q /ceip off /norestart /features OptionId.DeploymentTools

echo ####### %0 #######

