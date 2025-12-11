local toml = require("@toml")
local prettyprint = require("@pretty-print")
local base64 = require("@base64")

local toml_content = [[
[config]
key = "TG9vbSBpcyBzbyBjb29sISB3b3dvd293"
key2 = "VGhlIGJlc3QgdGhpbmcgc2luY2Ugc2xpY2VkIGJyZWFkIQ=="
]]

-- Deserialize the TOML content using the @toml library
local config = toml.deserialize(toml_content) :: any

print("------------------------------")
print("This is the original config")
print(config)
print("------------------------------")
print("Pretty printed original config:")
print(prettyprint(config))
print("------------------------------")
-- Decode the base64 encoded keys using the @base64 library
config.config.key = buffer.tostring(base64.decode(buffer.fromstring(config.config.key)))
config.config.key2 = buffer.tostring(base64.decode(buffer.fromstring(config.config.key2)))

print("Pretty printed decoded config:")
print(prettyprint(config))
print("------------------------------")
