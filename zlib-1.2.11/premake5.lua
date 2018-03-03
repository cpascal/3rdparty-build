-- premake5.lua
require "../premake/modules/modules"

workspace "zlib"
    configurations { "Debug", "Release" }
    location "_build_%{_ACTION}"

project "zlib-lib"
    language    "C"
    kind        "StaticLib"
    defines     { "N_FSEEKO" }
    warnings    "off"
    targetdir   "_build_%{_ACTION}/%{cfg.buildcfg}"

    files
    {
        "adler32.c",
        "crc32.c",
        "gzclose.c",
        "gzread.c",
        "infback.c",
        "inflate.c",
        "trees.c",
        "zutil.c",
        "compress.c",
        "deflate.c",
        "gzlib.c",
        "gzwrite.c",
        "inffast.c",
        "inftrees.c",
        "uncompr.c"
    }

    filter "system:windows"
        defines { "_WINDOWS" }

    filter "system:not windows"
        defines { 'HAVE_UNISTD_H' }
