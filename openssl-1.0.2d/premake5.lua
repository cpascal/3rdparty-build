local ROOT_DIR = path.getdirectory(_SCRIPT) .. "/"
local BUILD_DIR = ROOT_DIR .. "_build" .. "/"
if _ACTION then
	BUILD_DIR = ROOT_DIR .. "_build_" .. _ACTION .. "/"
end

-- Load the OpenSSL extension
include "../premake/modules/openssl/openssl.lua"

local openssl = premake.extensions.openssl

-- Configure the OpenSSL build
openssl_config = {
	src_dir = ROOT_DIR,
	include_dir = BUILD_DIR .. "include/",
	excluded_libs = {
		"jpake",
		"rc5",
		"md2",
		"store",
		"engine",
	},
}

--
-- Generate public OpenSSL header files
-- 
if _ACTION then
	print "Generating header files"
	premake.extensions.openssl.copy_public_headers(openssl_config)
end

--
-- Generate a solution with crypto/ssl Static Library projects
--
solution "openssl"
	configurations {
		"debug",
		"release",
	}

	language "C"
	kind "StaticLib"

	location (BUILD_DIR .. "projects/")
	objdir (BUILD_DIR .. "obj/")

	configuration {"debug"}
		targetdir (BUILD_DIR .. "lib/debug/")

	configuration {"release"}
		optimize "Speed"
		targetdir (BUILD_DIR .. "lib/release/")

	configuration {}

project "crypto"
	openssl.crypto_project(openssl_config)

project "ssl"
	openssl.ssl_project(openssl_config)

