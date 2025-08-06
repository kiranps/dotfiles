self: super: {
  ollama = super.stdenv.mkDerivation rec {
    pname = "ollama";
    version = "0.9.3"; # update with latest version

    src = super.fetchurl {
      url = "https://ollama.com/download/ollama-linux-amd64.tgz"; # or use GitHub release if available
      sha256 = "04bjpz97ya83ry7ji7y79wmpvvh4691pnwkmi1522wr8lldav2q8"; # replace with correct hash
    };

    nativeBuildInputs = [ super.autoPatchelfHook ];
    dontUnpack = true;
    buildInputs = [ super.gcc.cc.lib ];

    installPhase = ''
      mkdir -p $out
      tar -xzf $src -C $out
      chmod +x $out/bin/ollama
    '';
  };
}
