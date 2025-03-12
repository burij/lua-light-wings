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

    luaLightWings = pkgs.fetchurl {
      url = "https://github.com/burij/lua-light-wings/blob/v.0.2.2/modules/lua-light-wings.lua";
      sha256 = "sha256-BU/0FxpmiffNkMC9z/K+/cICnOIRW+4bMTb0Z968Yg4=";
    };

    nativeBuildInputs = [ pkgs.makeWrapper ];
    buildInputs = [ luaEnv ];

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/lib
      cp -r . $out/lib/app
      cp $luaLightWings $out/lib/app/lua-light-wings.lua

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
