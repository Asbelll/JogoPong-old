class.Score()

function Score:_init()
	self.scoreL = 0
	self.scoreR = 0
end

function Score:point(ballx)
	if ballx <= 0 then
		self.scoreR = self.scoreR + 1
		ball:_init(math.random(-155,155))
	elseif ballx >= love.graphics.getWidth() then
		self.scoreL = self.scoreL + 1
		ball:_init(math.random(-155,155))
	end
end