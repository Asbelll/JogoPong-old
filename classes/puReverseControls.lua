class.puReverseControls(PowerUp)

puReverseControls.imageDir = "images/powerUps/puReverseControls.png"
puReverseControls.duration = 10
puReverseControls.targetType = "reverse"
puReverseControls.enableSounds = {"sounds/reversecontrols.ogg"}

local keyUp, keyDown
local target

function puReverseControls:onEnable()
	target = self.target.side

	for key, command in pairs(commandList) do
		if (command == target.."PaddleDown") then
			keyDown = key
		end

		if (command == target.."PaddleUp") then
			keyUp = key
		end
	end

	commandList[keyDown] = target.."PaddleUp"
	commandList[keyUp] = target.."PaddleDown"
end

function puReverseControls:onDisable()
	commandList[keyDown] = target.."PaddleDown"
	commandList[keyUp] = target.."PaddleUp"
end
