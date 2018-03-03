-- premake5.lua

local packageList = {
    ["pahomqtt.c-1.0.3"] = {
        name = "pahomqtt",
        url = "http://www.openssl.org/source/openssl-1.0.2d.tar.gz",
    },
    ["zlib-1.2.11"] = {
        name = "zlib",
        url = "http://zlib.net/zlib-1.2.11.tar.gz",
    },
}

newaction
{
    trigger = "download",
    description = "Download openssl-1.0.2d source",
    execute = function()
	for k, v in pairs(packageList) do
		print("Downloading "..k)
		http.download(v.url, path.getname(v.url), { ["sslverifyhost"] = 0, ["sslverifypeer"] = 0 })
	end
    end
}
 
