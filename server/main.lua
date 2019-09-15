local socket = require "socket"
local server = socket.udp()

server:setsockname( "192.168.0.3", 22123 ) 

server:settimeout(0)


function love.update(dt)

	local msg = "AwesomeGameServer"

	server:setoption( "broadcast", true )

    local a,b = server:sendto( msg, "255.255.255.255", 22122 )

    server:setoption( "broadcast", false )

    --print(a,b)

end

function love.event.quit()
	server:close()
end

function love.draw()
	love.graphics.print("server")
end