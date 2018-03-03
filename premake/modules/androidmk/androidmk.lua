--
-- androidmk.lua
-- Generator for ndk-build makefiles
-- Author : Bastien Brunnenstein
--

premake.extensions.androidmk = premake.extensions.androidmk or {}
local androidmk = premake.extensions.androidmk

local function addOptionAllowed(fieldName, value)
       local field = premake.option.get("os");
       if not field then
               error("No such option: " .. fieldName, 2)
       end

       field.allowed = field.allowed or {}
       table.insert(field.allowed, value)
end

premake.ANDROID = "android"
premake.api.addAllowed("system", premake.ANDROID)
addOptionAllowed("os", { "android", "Android" })

include "_preload.lua"


function androidmk.slnApplicationFile(sln)
  return "Application.mk"
  --return sln.name .."_Application.mk"
end

function androidmk.slnAndroidFile(sln)
  return "Android.mk"
  --return sln.name .."_Android.mk"
end


function androidmk.prjFile(prj)
  return prj.name ..".mk"
end


androidmk.ldflags = {
  flags = {
    --LinkTimeOptimization = "-flto",
  }
}

androidmk.cflags = {
  flags = {
    FatalCompileWarnings = "-Werror",
    ShadowedVariables = "-Wshadow",
    UndefinedIdentifiers = "-Wundef",
    --LinkTimeOptimization = "-flto",
  },
  warnings = {
    Extra = "-Wall -Wextra",
    Off = "-w",
  }
}

androidmk.cppflags = {
  flags = {
    ["C++11"] = "-std=c++11",
    ["C++14"] = "-std=c++14",
  }
}


include "androidmk_api.lua"
include "androidmk_solution.lua"
include "androidmk_project.lua"
