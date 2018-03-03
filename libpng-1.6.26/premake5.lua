-- premake5.lua
require "../premake/modules/modules"

workspace "libpng"
    configurations { "Debug", "Release" }
    location "_build_%{_ACTION}"

project "libpng"
    language "C"
    kind "StaticLib"
    targetdir "_build_%{_ACTION}/%{cfg.buildcfg}"
    files {
        "png.c",
        "pngerror.c",
        "pngget.c",
        "pngmem.c",
        "pngread.c",
        "pngrio.c",
        "pngrtran.c",
        "pngrutil.c",
        "pngset.c",
        "pngtrans.c",
        "pngwio.c",
        "pngwrite.c",
        "pngwtran.c",
        "pngwutil.c",
    }

    filter {}

