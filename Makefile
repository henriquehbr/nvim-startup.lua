# allows running lua modules directly
export PATH := lua_modules/bin:$(PATH)

init: hooks install-deps

hooks:
	git config core.hooksPath .githooks

install-lua-deps:
	luarocks --tree=lua_modules install --only-deps nvim_startup-dev-1.rockspec

install-node-deps:
	npm i

install-deps: install-lua-deps install-node-deps

lint:
	luacheck --config .luacheckrc ./lua/**/*.lua
