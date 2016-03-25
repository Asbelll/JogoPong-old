class.puMagnet(PowerUp)

puMagnet.imageDir = "images/puMagnet.png"
puMagnet.duration = 5

function puMagnet:update(dt)
	paddleCY = self.target.y + self.target.height/2
	paddleCX = self.target.x + self.target.width/2
	distancia = math.abs(paddleCX - ball.x) / 2
	distancia = distancia + math.abs(paddleCY - ball.y)
	ball.speedY = ball.speedY + (paddleCY - ball.y) * 2 / distancia
end
