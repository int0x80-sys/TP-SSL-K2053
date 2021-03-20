@ECHO OFF
cd premake/windows
premake4 --os=windows --file=../../premake4.lua codeblocks
cd ../..
@ECHO ON