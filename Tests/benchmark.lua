--[[-- simple benchmark
local tstart = os.time()
while tstart == os.time() do end
tstart = os.time()
local n = 0
while os.time()-tstart<=10 do sha1(string.rep("a", 200)) n = n + 1 end
print("times: ",n)
if true then return end
--]]




--[[-- arithmethic benching
local function bench(tx,f,t)
	local n = 0;
	local s = os.time()
	while s == os.time() do end
	local s = os.time()+t
	while os.time()<s do f() n = n + 1 end
	print(tx,n,w32_to_bit_string(f()))
	return n
end

local a,b,c,d = 0x98BADCFE,0xC3D2E1F0,0xEFCDAB89,0x67452301
bench("ADD",function() return w32_add(a,b) end,1)
bench("XOR",function() return w32_xor(a,b) end,1)
bench("XOR2",function() return w32_xor_n(a,b,c,d) end,1)
bench("AND",function() return w32_and(a,b) end,1)
bench("OR",function() return w32_or(a,b) end,1)
bench("OR3",function() return w32_or3(a,b,c) end,1)
bench("NOT",function() return w32_not(d) end,1)
bench("ROT",function() return w32_rot(7,d) end,1)
bench("ROT",function() return w32_rot(1,d) end,1)
bench("HEX",function() return w32_to_hexstring(d) end,1)
--]]