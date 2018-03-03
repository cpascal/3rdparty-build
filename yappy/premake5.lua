-- premake5.lua
require "../premake/modules/modules"

workspace "yappy"
    configurations { "Debug", "Release" }
    location "_build_%{_ACTION}"

project "yappy"
    language "C"
    kind "StaticLib"
    targetdir "_build_%{_ACTION}/%{cfg.buildcfg}"
    files {
        "src/yappy.cpp"
    }

    filter {}

