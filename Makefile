# allows running lua modules directly
export PATH := lua_modules/bin:$(PATH)

LUAROCKS := $(shell luarocks --version 2> /dev/null)

# check if luarocks is installed
check-luarocks:
ifndef LUAROCKS
	@echo "Luarocks is not installed!"
	exit 1
endif

install: check-luarocks
	luarocks --tree=lua_modules install --only-deps nvim_startup-dev-1.rockspec

lint:
	luacheck ./lua/**/*.lua
