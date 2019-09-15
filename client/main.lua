local socket = require "socket"
local client = socket.udp()

function love.load()

	client = socket.udp()  --make a new socket
	client:setsockname( "192.168.0.3", 22122 )  --set the socket name to the real IP address

	client:settimeout( 0 )

	continuar = true
end


function love.update(dt)

	if continuar then

			local data, ip, port = client:receivefrom()

			if data then
				print(data,ip,port)
				continuar=false

				client:close()
			end


	end
	
end

function love.event.quit()
	client:close()
end

