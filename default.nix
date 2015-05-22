{ mkDerivation, base, getopt-generics, regex-compat, stdenv }:
mkDerivation {
  pname = "regex";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base getopt-generics regex-compat ];
  license = stdenv.lib.licenses.mpl20;
}
