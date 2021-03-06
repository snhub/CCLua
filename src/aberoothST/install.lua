-- install
-- Execute this program to install the startui user interface
-- and all available apps.


local pages = {}
--3456789012345678901234567890123456789
pages[1] = 
[[Hi, this is startUI, a user interface
for running apps and managing user
input. After installation, you can
start with the command "startui".
For more information navigate to "Help"
with the arrow keys on the startUI
Start page and hit ENTER.
For furter support checkout my Youtube
channels "Loehtmann" for german
speakers or AberoothST for english.
Have fun!

Press y to install or n to cancel>]]

local apis = {
	{"commonAPI", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/commonAPI.lua"},
	{"start", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/startUI.lua"},
	{"turtleAPI", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/turtleAPI.lua"},
	{"guiAPI", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/guiAPI.lua"},
	{"geom", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/geom.lua"},
	{"sorterAPI", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/sorterAPI.lua"}
	
}

local apps = {
	{"weather", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/weather.lua"},
	{"floor", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/floor.lua"},
	{"cluster", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/turtleCluster.lua"},
	{"pattern", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/pattern.lua"},
	{"wall", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/wall.lua"},
	{"iCounter", "https://raw.github.com/snhub/CCLua/master/src/aberoothST/itemCounter.lua"}
}

for i = 1, #pages do
	term.clear()
	term.setCursorPos(1, 1)
	io.write(pages[i])
--	if i < #pages then
--		io.write("Page "..i.."/5 Press any key to continue")
--		local event, char = os.pullEvent "char"
--	end
end

local event, char = os.pullEvent "char"

term.clear()
term.setCursorPos(1, 1)

if char == "y" then

	for i = 1, #apis do
		io.write("downloading "..apis[i][1])
		local response = http.get(apis[i][2])
		io.write("..writing")
		local file = fs.open(apis[i][1], "w")
		file.write(response.readAll())
		file.close()
		print("..done")
	
	end
	print()
	
	fs.delete("_apps")
	fs.makeDir("_apps")	
	for i = 1, #apps do
		io.write("downloading "..apps[i][1])
		local response = http.get(apps[i][2])
		io.write("..writing")
		local file = fs.open(fs.combine("_apps", apps[i][1]), "w")
		file.write(response.readAll())
		file.close()
		print("..done")
	
	end
	
	print()
	print("Installation complete")
	print("You can run startUI by typing \"startui\"")
	print("(You maybe need to reboot)") 
	print("Have fun")
	

end

--