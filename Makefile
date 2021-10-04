# allows running lua modules directly
export PATH := lua_modules/bin:$(PATH)

# allows running rust crates directly
export PATH := rust_modules/bin:$(PATH)

init: hooks install-deps

hooks:
	git config core.hooksPath .githooks

install-lua-deps:
	luarocks --tree=lua_modules install --only-deps nvim_startup-dev-1.rockspec

install-rust-deps:
	cargo install stylua --root rust_modules

install-node-deps:
	npm i

install-deps: install-lua-deps install-rust-deps install-node-deps

stylua:
	stylua lua/ataraxis

luacheck:
	luacheck --config .luacheckrc ./lua/**/*.lua

lint: stylua luacheck
