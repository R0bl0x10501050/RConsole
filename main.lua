local Console = {}

function Console.assert(condition, errmsg)
	assert(condition, errmsg)
end

function Console.clear()
	print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
end

function Console:count(label: string?)
	if not self.counts then self.counts = 0 end
	self.counts += 1
	
	if label then
		self.log(label..": "..self.counts)
		return
	end
	
	self.log("default: "..self.counts)
end

function Console.error(thing)
	error(thing)
end

-- No Console.info() :(

function Console.log(thing)
	print(thing)
end

function Console.table(array)
	if typeof(array) == "table" then
		local dict = {}
		local currententry = 1
		for _, v in ipairs(array) do
			dict[currententry] = v
			currententry += 1
		end
		print(dict)
	end
end

function Console:time(label: string?)
	if not label then label = "default" end
	self[label] = tick()
end

function Console:timeEnd(label: string?)
	if not label then label = "default" end
	local currtime = tick() - self[label]
	print(label..": "..currtime.." ms")
end

function Console.stack()
	print(script:GetFullName())
end


function Console.warn(thing)
	warn(thing)
end

return Console
