-- function isValid(s: string): boolean {
--   const inverses = {
--     ')': '(',
--     '}': '{',
--     ']': '['
--   } as const;
--   const opened = [];
--   const openBrackets = new Set(['(', '{', '[']);
--   for (const ss of s) {
--     if (openBrackets.has(ss)) {
--       opened.push(ss)
--     } else {
--       if (opened.length === 0) return false; // Early return if no opening bracket to match
--       const last = opened.pop()
--       const inverse = inverses[ss]
--       if (inverse !== last) {
--         return false;
--       }
--     }
--   }
--   return opened.length === 0;
-- }
local function isValid(s)
	local inverses = { [")"] = "(", ["}"] = "{", ["]"] = "[" }
	local openers = { ["("] = "(", ["{"] = "{", ["["] = "[" }
	local stack = {}

	for i = 1, string.len(s), 1 do
		local char = string.sub(s, i, i)
		print(char)
		if openers[char] ~= nil then
			table.insert(char)
		end
	end
end

isValid("()")
