local toml = require("@toml")
local prettyprint = require("@pretty-print")
local base64 = require("@base64")

local toml_content = [[
[config]
key = "TG9vbSBpcyBzbyBjb29sISB3b3dvd293"
key2 = "VGhlIGJlc3QgdGhpbmcgc2luY2Ugc2xpY2VkIGJyZWFkIQ=="
]]

local config = toml.deserialize(toml_content) :: any

config.config.key = buffer.tostring(base64.decode(buffer.fromstring(config.config.key)))
config.config.key2 = buffer.tostring(base64.decode(buffer.fromstring(config.config.key2)))

print(prettyprint(config))
