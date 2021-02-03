@echo off

set EXE=..\software\adksetup.exe

echo ####### %0 #######

echo installing Microsoft ADK deployment tools ...
%EXE% /q /ceip off /norestart /features OptionId.DeploymentTools

echo ####### %0 #######

