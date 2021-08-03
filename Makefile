# allows running lua modules directly
export PATH := lua_modules/bin:$(PATH)

install:
	luarocks --tree=lua_modules install --only-deps nvim_startup-dev-1.rockspec

lint:
	luacheck ./lua/**/*.lua
