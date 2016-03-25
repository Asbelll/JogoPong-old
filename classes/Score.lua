class.Score()

local scoreSound = love.audio.newSource("sounds/score.ogg")
function Score:_init()
	self.scoreL = 0
	self.scoreR = 0
	self.font = love.graphics.newFont("computer_pixel-7.ttf", 100)
end

function Score:point(ballx)
	if ballx <= 0 then
		self.scoreR = self.scoreR + 1
		ball:_init(math.random(-155,155), ball.color)
		scoreSound:play()
	elseif ballx >= love.graphics.getWidth() then
		self.scoreL = self.scoreL + 1
		ball:_init(math.random(-155,155), ball.color)
		scoreSound:play()
	end
end

function Score:draw(ballx)
	love.graphics.setFont(self.font)
	love.graphics.printf(self.scoreL, love.graphics.getWidth()/2 - 210, 10, 200, "right")
	love.graphics.printf(self.scoreR, love.graphics.getWidth()/2 + 15, 10, 200, "left")
end
