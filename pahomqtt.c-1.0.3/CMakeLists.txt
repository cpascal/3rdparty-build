cmake_minimum_required(VERSION 2.8)

project(libmqtt C)

set(VERSION "1.0.3")

set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/..")

include(xplatform)

#configure_file ( config.h.cmake ${CMAKE_CURRENT_SOURCE_DIR}/config.h )

#if(NOT CMAKE_BUILD_TYPE)
#   set(CMAKE_BUILD_TYPE "Debug")
#    set(CMAKE_BUILD_TYPE "Release")
#    message("No CMAKE_BUILD_TYPE specified, defaulting to ${CMAKE_BUILD_TYPE}") 
#endif(NOT CMAKE_BUILD_TYPE)

# to distinguish between debug and release lib
#set(CMAKE_DEBUG_POSTFIX "_d")

include_directories("${PROJECT_SOURCE_DIR}/../libmqtt-1.0.3/include")
link_directories("${PROJECT_SOURCE_DIR}/../libmqtt-1.0.3")

message("CMAKE_PREFIX_PATH=${CMAKE_PREFIX_PATH}")

set(MQTT_MAIN_SOURCES
    src/Clients.c
    src/Heap.c
    src/LinkedList.c
    src/Log.c
    src/Messages.c
    src/MQTTPacket.c
    src/MQTTPacketOut.c
    src/MQTTPersistence.c
    src/MQTTPersistenceDefault.c
    src/MQTTProtocolClient.c
    src/MQTTProtocolOut.c
    src/Socket.c
    src/SocketBuffer.c
    src/SSLSocket.c
    src/StackTrace.c
    src/Thread.c
    src/Tree.c
    src/utf-8.c
)

# for async 
set(MQTT_SUB_SOURCES 
    src/MQTTAsync.c
)

# for sync
#set(MQTT_SUB_SOURCES 
#    src/MQTTClient.c
#)

# for exe
set(MQTT_VERSION_EXE_SOURCES
    src/MQTTVersion.c
)

set(MQTT_SOURCES ${MQTT_MAIN_SOURCES} ${MQTT_SUB_SOURCES})

set(MQTT_HEADERS 
    src/Clients.h
    src/Heap.h
    src/LinkedList.h
    src/Log.h
    src/Messages.h
    src/MQTTAsync.h
    src/MQTTClient.h
    src/MQTTClientPersistence.h
    src/MQTTPacket.h
    src/MQTTPacketOut.h
    src/MQTTPersistence.h
    src/MQTTPersistenceDefault.h
    src/MQTTProtocol.h
    src/MQTTProtocolClient.h
    src/MQTTProtocolOut.h
    src/Socket.h
    src/SocketBuffer.h
    src/SSLSocket.h
    src/StackTrace.h
    src/Thread.h
    src/Tree.h
    src/utf-8.h
)

set(MQTT_PUBLIC_HEADERS
    src/Clients.h
    src/Heap.h
    src/LinkedList.h
    src/Log.h
    src/Messages.h
    src/MQTTAsync.h
    src/MQTTClient.h
    src/MQTTClientPersistence.h
    src/MQTTPacket.h
    src/MQTTPacketOut.h
    src/MQTTPersistence.h
    src/MQTTPersistenceDefault.h
    src/MQTTProtocol.h
    src/MQTTProtocolClient.h
    src/MQTTProtocolOut.h
    src/Socket.h
    src/SocketBuffer.h
    src/SSLSocket.h
    src/StackTrace.h
    src/Thread.h
    src/Tree.h
    src/utf-8.h
)

include_directories("${PROJECT_SOURCE_DIR}")
include_directories("${PROJECT_SOURCE_DIR}/include")
include_directories("${PROJECT_SOURCE_DIR}/lib")

add_definitions(-DHAVE_CONFIG_H -DUSE_MEMORY_H)
add_definitions(-DFLOAT_LOOKUP)

# TODO: APPLE -DDARWIN -fno-common -force_cpusubtype_ALL -Wall -g -O3 -ffast-math -fsigned-char -Wdeclaration-after-statement 

if(MSVC)
    add_definitions(/D_UNICODE /DUNICODE)
    list(APPEND libmqtt_SRCS win32/mqtt.def)
endif(MSVC)

add_library(mqtt STATIC ${MQTT_SOURCES})
if(MSVC)
    set_target_properties(mqtt PROPERTIES
        OUTPUT_NAME libmqtt_static
        COMPILE_PDB_NAME libmqtt_static${CMAKE_DEBUG_POSTFIX}
    )
else()
    set_target_properties(mqtt PROPERTIES OUTPUT_NAME mqtt_static)
endif()

install(TARGETS mqtt
    RUNTIME DESTINATION bin
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)

install(FILES ${MQTT_PUBLIC_HEADERS} DESTINATION include)
