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
		yf = posY + height
	}
end

function Hit:checkCollision(hitbox1, hitbox2)
	if 	((hitbox1.x <= hitbox2.xf and hitbox1.x >= hitbox2.x) or (hitbox1.xf <= hitbox2.xf and hitbox1.xf >= hitbox2.x)) and ((hitbox1.y <= hitbox2.yf and hitbox1.y >= hitbox2.y) or (hitbox1.yf <= hitbox2.yf and hitbox1.yf >= hitbox2.y)) then
		return true
	else
		return false
	end
end
