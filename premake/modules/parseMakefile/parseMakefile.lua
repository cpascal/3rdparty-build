premake.modules.parseMakefile = {}

local parseMakefile = premake.modules.parseMakefile

parseMakefile.parse = function(pathToMakefile)
	local ret = {
		actions = {},
		env = {}
	}

	-- read makefile, one line at a time
	local f = assert(io.open(pathToMakefile))
	local line = ""
	while true do
		local curr = f:read("*line")
		--line = line .. " " .. f:read("*line")
		if not curr then break end
		if #curr ~= 0 then
			line = line .. curr
			if curr:sub(#curr) == "\\" then
				line = line:sub(0, #line-1)
			else
				local param, value = line:match('^([%w|_]+)%s-=%s-(.+)$');
				if param and value ~= nil then
					ret.env[param] = value
				end
				line = ""
			end
		else
			line = ""
		end
	end

	-- handle the case where public headers are included in the private_headers
	local idx, header
	for idx, header in ipairs(ret.private_headers) do
		if header == "$(EXHEADER)" then
			ret.private_headers[idx] = nil
			for _, publicheader in ipairs(ret.public_headers) do
				table.insert(ret.private_headers, publicheader)
			end
			break
		end
	end

	return ret
end

return parseMakefile

