+++
title = "Anaconda"
author = ["Daniel Biasiotto"]
date = 2022-03-29T18:30:00+02:00
draft = false
+++

A [Python]({{< relref "20210328164122-python.md" >}}) Data Science Platform.
To install in [NixOS]({{< relref "nixos.md" >}}) see [this](http://www.jaakkoluttinen.fi/blog/conda-on-nixos/) great post, the author defined a nix expression:

<div class="source">

\## ~/.conda-shell.nix
{ pkgs ? import &lt;nixpkgs&gt; {} }:

let

installationPath = "~/.conda";

minicondaScript = pkgs.stdenv.mkDerivation rec {
  name = "miniconda-\\({version}";
    version = "4.3.11"; # check for latest version (ATTOW 4.11.0)
    src = pkgs.fetchurl {
      url = "https://repo.continuum.io/miniconda/Miniconda3-\\){version}-Linux-x86_64.sh";
    sha256 = "1f2g8x1nh8xwcdh09xcra8vd15xqb5crjmpvmc2xza3ggg771zmr";
  };

unpackPhase = "true";

installPhase = ''
  mkdir -p $out
  cp $src $out/miniconda.sh
'';

  fixupPhase = ''
    chmod +x $out/miniconda.sh
  '';
};

conda = pkgs.runCommand "conda-install"
  { buildInputs = [ pkgs.makeWrapper minicondaScript ]; }
  ''
    mkdir -p $out/bin
    makeWrapper                            \\
      ${minicondaScript}/miniconda.sh      \\
      $out/bin/conda-install               \\
      --add-flags "-p ${installationPath}" \\
      --add-flags "-b"
  '';

in
(
  pkgs.buildFHSUserEnv {
    name = "conda";
    targetPkgs = pkgs: (
      with pkgs; [

conda

xorg.libSM
xorg.libICE
xorg.libXrender
libselinux

gcc

emacs
git

  ]
);
profile = ''

export PATH=${installationPath}/bin:$PATH

export NIX_CFLAGS_COMPILE="-I\\({installationPath}/include"
      export NIX\_CFLAGS\_LINK="-L\\){installationPath}lib"

      export FONTCONFIG_FILE=/etc/fonts/fonts.conf
      export QTCOMPOSE=${pkgs.xorg.libX11}/share/X11/locale
    '';
  }
).env

</div>

Then you enter the environment with `nix-shell ~/.conda-shell.nix`
