local function fact(v)
	local a = 1
	for i = 1, v, 1 do
		a = a * i
	end
	return a
end

local res = fact(4)
print(res)

local function fact2(v)
	if v == 1 then
		return v
	end
	return v * fact2(v - 1)
end

local res2 = fact2(4)
print(res2)
