class.Hit()

--[[
[22:53:22] Matheus: Yf = (velocidadeDoPaddle + [PP] + Y)
[22:53:43 | Edited 23:00:08] Matheus: Xf = X - (|Yf| - |Y|)
[22:54:34] Matheus: Limitar velocidade mínima de X
]]--

function Hit:createHitbox(posX, posY, width, height)
	return {
		x = posX,
		y = posY,
		xf = posX + width,
		yf = posY + height,
		xc = (posX + width/2),
		yc = (posY + height/2)
	}
end

function Hit:checkCollision(hitbox1, hitbox2)
	if 	((hitbox1.x <= hitbox2.xf and hitbox1.x >= hitbox2.x) or (hitbox1.xf <= hitbox2.xf and hitbox1.xf >= hitbox2.x)) and ((hitbox1.y <= hitbox2.yf and hitbox1.y >= hitbox2.y) or (hitbox1.yf <= hitbox2.yf and hitbox1.yf >= hitbox2.y)) then

		-- Verifica em que altura do hitbox2 houve a colisão
		pHeight = ((hitbox1.yc - hitbox2.y)/100)-50
		return pHeight

	else
		return false
	end
end

function Hit:wallCollision(ball)
	if (ball.y <= 0) then
		ball.y = 0
		ball.speedY = ball.speedY * -1
	elseif (ball.y + ball.radius*2 >= love.graphics.getHeight()) then
	    ball.y = love.graphics.getHeight() - ball.radius*2
	    ball.speedY = ball.speedY * -1
	end

	return ball
end

function Hit:paddleCollision(ball, paddle)
	local PP = self:checkCollision(ball.hitbox, paddle.hitbox)

	if (PP) then
		local speedYF = (paddle.speed + PP + ball.speedY)
		ball.speedX = ball.speedX - (math.abs(speedYF) - math.abs(ball.speedY))
		ball.speedY = speedYF

		if (ball.direct == 1) then
			ball.direct = 2
		else
			ball.direct = 1
		end
	end

	return ball
end
