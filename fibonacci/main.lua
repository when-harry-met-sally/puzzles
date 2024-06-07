---@type table<number, number>
local m = {}

---@param n number
local function fib(n)
	if n <= 1 then
		return n
	end
	if m[n] then
		return m[n]
	end
	m[n] = fib(n - 2) + fib(n - 1)
	return m[n]
end

print(fib(5))
