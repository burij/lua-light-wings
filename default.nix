{ pkgs ? import <nixpkgs> {} }:

let
  luaEnv = pkgs.lua.withPackages (ps: with ps; [
    luarocks
    luafilesystem
  ]);

  myLuaApp = pkgs.stdenv.mkDerivation {
    pname = "app";
    version = "1.0.0";

    src = ./.;

    nativeBuildInputs = [ pkgs.makeWrapper ];
    buildInputs = [ luaEnv ];

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/lib
      cp -r . $out/lib/app
      makeWrapper ${luaEnv}/bin/luarocks $out/bin/luarocks
      makeWrapper ${luaEnv}/bin/lua $out/bin/app \
        --add-flags "$out/lib/app/main.lua" \
        --set LUA_PATH "$out/lib/app/?.lua;$out/lib/app/?/init.lua" \
        --set LUA_CPATH "${luaEnv}/lib/lua/${luaEnv.lua.luaversion}/?.so"
    '';

    meta = with pkgs.lib; {
      description = "My Lua application";
      license = licenses.mit;
      platforms = platforms.all;
    };
  };
in myLuaApp
