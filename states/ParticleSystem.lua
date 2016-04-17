-- Módulo de partículas.

class.ParticleSystem()

function ParticleSystem:load()
	require("particleEfx/pFireball")
end

function ParticleSystem:close()
	self.effects = nil
end

function ParticleSystem:enable()
	self.effects = {}
end

function ParticleSystem:disable()
end

function ParticleSystem:update(dt)
	for index, effect in pairs(self.effects) do
		effect:update(dt)
	end
end

function ParticleSystem:draw()
end

function ParticleSystem:newEffect(name, object)
	local id = #self.effects + 1
	if (name:lower() == "fireball") then
		self.effects[id] = pFireball()
	end

	self.effects[id].object = object

	return id
end
