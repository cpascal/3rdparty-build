-- premake5.lua

newaction
{
    trigger = "download",
    description = "Download openssl-1.0.2d source",
    execute = function()
        http.download( "http://www.openssl.org/source/openssl-1.0.2d.tar.gz", "openssl-1.0.2d.tar.gz" );
    end
}
 
