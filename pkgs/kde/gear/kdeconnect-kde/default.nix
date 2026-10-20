{
  lib,
  mkKdeDerivation,
  replaceVars,
  sshfs,
  qtbase,
  qtconnectivity,
  qtmultimedia,
  pkg-config,
  wayland,
  wayland-protocols,
  libei,
  libevdev,
  libfakekey,
  fetchFromGitLab
}:
mkKdeDerivation {
  pname = "kdeconnect-kde";

  patches = [
    (replaceVars ./hardcode-sshfs-path.patch {
      sshfs = lib.getExe sshfs;
    })
  ];

  src = fetchFromGitLab {
    owner = "dshatz";
    repo = "kdeconnect-kde";
    domain = "invent.kde.org";
    rev = "geolocation2";
    hash = "sha256-ayGUufKrN2wOrs74yIBNL2AanmhyX4pSP1DDmjkOqs0=";
  };
#   src = /home/dshatz/dev/cpp/kdeconnect-kde;

  # Hardcoded as a QString, which is UTF-16 so Nix can't pick it up automatically
  postFixup = ''
    mkdir -p $out/nix-support
    echo "${sshfs}" > $out/nix-support/depends
  '';

  extraNativeBuildInputs = [ pkg-config ];
  extraBuildInputs = [
    qtconnectivity
    qtmultimedia
    wayland
    wayland-protocols
    libei
    libevdev
    libfakekey
  ];

  extraCmakeFlags = [
    "-DQtWaylandScanner_EXECUTABLE=${qtbase}/libexec/qtwaylandscanner"
    "-DUDEVDIR=udev"
  ];
}
