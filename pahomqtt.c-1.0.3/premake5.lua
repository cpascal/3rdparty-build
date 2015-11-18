-- premake5.lua
require "../premake/modules/modules"

workspace "pahomqtt"
    configurations { "Debug", "Release" }
    location "build_%{_ACTION}"
    if _ACTION == "androidmk" then
        location "build_%{_ACTION}/jni"
        ndkabi "all"
        ndkplatform "android-9"
    end

project "pahomqtt"
    language "C"
    kind "StaticLib"
    targetdir "build_%{_ACTION}/%{cfg.buildcfg}"
    files {
        "src/Clients.c",
        "src/Heap.c",
        "src/LinkedList.c",
        "src/Log.c",
        "src/Messages.c",
        "src/MQTTAsync.c",
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
    editandcontinue "Off"

    filter "configurations:Debug"
        defines { "DEBUG", "_DEBUG" }
        flags { "Symbols" }

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter { "action:vs*", "language:C or C++" }
        defines { "WIN32" }

    filter { "system:android" }
        print( _system );

    filter {}

 
