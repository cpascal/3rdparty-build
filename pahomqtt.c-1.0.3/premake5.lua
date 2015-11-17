-- premake5.lua
require "../premake/modules/modules"

workspace "pahomqtt"
    configurations { "Debug", "Release" }
    platforms { "android" }

project "pahomqtt"
    language "C"
    kind "StaticLib"
    targetdir "build/%{cfg.buildcfg}"
    files {
        "src/Clients.c",
        "src/Heap.c",
        "src/LinkedList.c",
        "src/Log.c",
        "src/Messages.c",
        "src/MQTTPacket.c",
        "src/MQTTPacketOut.c",
        "src/MQTTPersistence.c",
        "src/MQTTPersistenceDefault.c",
        "src/MQTTProtocolClient.c",
        "src/MQTTProtocolOut.c",
        "src/Socket.c",
        "src/SocketBuffer.c",
        "src/SSLSocket.c",
        "src/StackTrace.c",
        "src/Thread.c",
        "src/Tree.c",
        "src/utf-8.c"
    }

    if _ACTION == "androidmk" then
        location "android/jni"
        ndkabi "all"
        ndkplatform "android-9"
    end

    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG" }
        flags { "Symbols" }

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter { "configurations:vs*", "language:C or C++" }
        defines { "WIN32" }

    filter { "platforms:android" }
        defines { "WIN32" }

    filter {}

