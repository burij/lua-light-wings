let
	nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";
	pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
	packages = with pkgs; [
		wget
		(lua5_4.withPackages(ps: with ps; [
			luarocks
		]))
	];

	shellHook = ''
		alias run='lua main.lua'
		# luarocks install dkjson --tree ./pkgs
		export LUA_PATH="./pkgs/share/lua/5.4/?.lua;./share/lua/5.4/?/init.lua;$LUA_PATH"
		export LUA_CPATH="./pkgs/lib/lua/5.4/?.so;$LUA_CPATH"
	'';
}