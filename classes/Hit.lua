class.Hit()

function Hit:createHitbox(posX, posY, width, height)
	return {
		x = posX,
		y = posY,
		w = width,
		h = height,
		xf = posX + width, -- Posição do xFinal na janela.
		yf = posY + height, -- Posição do yFinal na janela.
		xc = (posX + width/2), -- Posição do centro do X na janela.
		yc = (posY + height/2) -- Posição do centro do Y na janela.
	}
end

function Hit:checkCollision(hitbox1, hitbox2)
	-- Verifica se uma das extremidades do hitbox1 se encontra dentro das limitações do hitbox2.
	if 	((hitbox1.x <= hitbox2.xf and hitbox1.x >= hitbox2.x) or (hitbox1.xf <= hitbox2.xf and hitbox1.xf >= hitbox2.x)) and ((hitbox1.y <= hitbox2.yf and hitbox1.y >= hitbox2.y) or (hitbox1.yf <= hitbox2.yf and hitbox1.yf >= hitbox2.y)) then

		-- Verifica em que altura do hitbox2 houve a colisão (baseando-se no centro Y do hitbox1).
		pHeight = ((hitbox1.yc - hitbox2.y)/10)-(hitbox2.h / 20)
		return pHeight

	else
		return false
	end
end

function Hit:wallCollision(ball)
	-- Verifica se a bola passou dos limites da janela, nesse caso, sua
	-- trajetória será alterada e depois será reposicionada para dentro da camera.
	if (ball.y <= 0) then
		ball.y = 0
		ball.speedY = ball.speedY * -1
		wallHitSound:play()
	elseif (ball.y + ball.radius >= love.graphics.getHeight()) then
	    ball.y = love.graphics.getHeight() - ball.radius
	    ball.speedY = ball.speedY * -1
	    wallHitSound:play()
	end

	return ball
end

function Hit:paddleCollision(ball, paddle)
	-- Dá o valor de pHeight à variável PP.
	local PP = self:checkCollision(ball.hitbox, paddle.hitbox)

	if (PP) then
		-- Faz os cálculos de física atribuindo o resultado à variável speedYF.
		-- Y ganha uma velocidade equivalente à metade da velocidade do paddle somado ao bônus da Parte do Paddle.
		local speedYF = (paddle.speed/2 + PP * 30 + ball.speedY)

		-- O valor em velocidade ganho no SpeedY será retirado do SpeedX para manter a velocidade total,
		-- se esse valor for negativo, significa que o Y perdeu velocidade, e assim a subtração passará a ser uma adição.
		ball.speedX = ball.speedX - (math.abs(speedYF) - math.abs(ball.speedY))
		-- Atualiza SpeedY.
		ball.speedY = speedYF

		-- Cria velocidade mínima horizontal da bola.
		if (ball.speedX < 250) then
			ball.speedX = 250
		end

		-- Cria velocidade máxima vertical da bola.
		if (ball.speedY > 800) then
			ball.speedY = 800
		elseif (ball.speedY < -800) then
		    ball.speedY = -800
		end

		-- Coloca a bola na frente do paddle e a redireciona.
		if (ball.xDirect == 1) then
			ball.x = paddle.x - ball.radius
			ball.xDirect = 2
		else
			ball.x = paddle.x + paddle.width + ball.radius
			ball.xDirect = 1
		end

		paddle:playHitSound()
	end

	return ball
end
