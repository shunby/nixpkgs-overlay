{stdenv, cmake, ninja} : 
let
  src = builtins.fetchGit {
    url = "https://github.com/0vercl0k/rp";
    ref = "master";
    rev = "2f45c4fbf3b489f1653aba35036bfeab03384542";
  };
in
stdenv.mkDerivation rec {
  pname = "rp-lin";
  version ="latest";
  inherit src;
  nativeBuildInputs = [ cmake ninja ];
  configurePhase = ''
    cd src
    cmake -DCMAKE_BUILD_TYPE=Release -GNinja
    cd ..
  '';
  buildPhase = ''
    cd src
    cmake --build .
    cd ..
  '';
  installPhase = ''
    cd src
    mkdir -p $out/bin
    cp rp-lin $out/bin/rp-lin
    cd ..
  '';
}
