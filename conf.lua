-- Importa algumas das bibliotecas necessárias
require 'lib/pl'
require("lib/stateManager")
require("lib/lovelyMoon")
require("lib/cupid")
binser = require "lib/binser"

function love.conf(t)
	t.version = "0.9.2"
	t.window.title = "JogoNave"
end
