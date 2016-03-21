class.Hit()

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
		pHeight = ((hitbox1.yc - hitbox2.y)/10)-5
		return pHeight

	else
		return false
	end
end

function Hit:wallCollision(ball)
	if (ball.y <= 0) then
		ball.y = 0
		ball.speedY = ball.speedY * -1
	elseif (ball.y + ball.radius >= love.graphics.getHeight()) then
	    ball.y = love.graphics.getHeight() - ball.radius
	    ball.speedY = ball.speedY * -1
	end

	return ball
end

function Hit:paddleCollision(ball, paddle)
	local PP = self:checkCollision(ball.hitbox, paddle.hitbox)

	if (PP) then
		local speedYF = (paddle.speed/2 + PP * 30 + ball.speedY)
		ball.speedX = ball.speedX - (math.abs(speedYF) - math.abs(ball.speedY))
		ball.speedY = speedYF

		if (ball.speedX < 250) then
			ball.speedX = 250
		end

		if (ball.speedY > 800) then
			ball.speedY = 800
		elseif (ball.speedY < -800) then
		    ball.speedY = -800
		end

		if (ball.direct == 1) then
			ball.x = paddle.x - ball.radius
			ball.direct = 2
		else
			ball.x = paddle.x + paddle.width + ball.radius
			ball.direct = 1
		end
	end

	return ball
end
