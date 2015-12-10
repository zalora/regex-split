{ mkDerivation, base, getopt-generics, regex-compat, stdenv }:
mkDerivation {
  pname = "regex-split";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base getopt-generics regex-compat ];
  license = stdenv.lib.licenses.mpl20;
}
