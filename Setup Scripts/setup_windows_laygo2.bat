@echo off

REM Edit .maginit
echo source $env(PDKPATH)/libs.tech/magic/sky130A.magicrc>"%~dp0..\laygo2_workspace_sky130\.maginit"
echo source .maginit_personal>>"%~dp0..\laygo2_workspace_sky130\.maginit"

REM Create .maginit_personal
echo addpath $env(PWD)/magic_layout/skywater130_microtemplates_dense>"%~dp0..\laygo2_workspace_sky130\.maginit_personal"
echo addpath $env(PWD)/magic_layout/logic_generated>>"%~dp0..\laygo2_workspace_sky130\.maginit_personal"

REM Copy compile_tcl.sh into laygo2_workspace_sky130
copy "%~dp0..\Setup Scripts\compile_tcl.sh" "%~dp0..\laygo2_workspace_sky130"
