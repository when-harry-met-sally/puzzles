local m = {}
local function bigStepper(n)
	if n <= 1 then
		return 1
	end
	if m[n] then
		return m[n]
	end
	m[n] = bigStepper(n - 1) + bigStepper(n - 2)
	return m[n]
end
