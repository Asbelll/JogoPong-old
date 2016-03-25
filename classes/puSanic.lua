class.puSanic(PowerUp)

puSanic.imageDir = "images/puSanic.png"
puSanic.duration = 1

function puSanic:onEnable()
	ball.speedY = ball.speedY * 2
	ball.speedX = ball.speedX * 2
end
