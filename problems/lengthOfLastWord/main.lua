---@param word string
local function lengthOfLastWord(word)
	---@type table<string>
	local m = {}
	for w in word:gmatch("%S+") do
		table.insert(m, w)
	end
	return #m[#m]
end

print(lengthOfLastWord("Hello                World                          "))
