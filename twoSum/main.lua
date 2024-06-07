-- add all elements of array `a'
local cjson = require("cjson")
---@param target number
---@param nums number[]
local function twoSum(nums, target)
	---@type table<number, number>
	local a = {}
	for i, v in ipairs(nums) do
		if a[v] then
			return { a[v], i }
		end
		a[target - v] = i
	end
end
local nums = { 11, 7, 2 }

local target = 9
local res = twoSum(nums, target)
print(cjson.encode(res))
