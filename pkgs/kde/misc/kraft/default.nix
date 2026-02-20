{
  lib,
  mkKdeDerivation,
  fetchFromGitHub,
  libgit2,
  extra-cmake-modules,
  kio,
  ki18n,
  kidletime,
  kxmlgui,
  kcmutils,
  libplasma,
  plasma5support,
  kcontacts,
  ktexttemplate,
  akonadi,
  akonadi-contacts,
}:
mkKdeDerivation rec {
  pname = "kraft";
  version = "2.0.0";
  src = fetchFromGitHub {
    owner = "dragotin";
    repo = "kraft";
    tag = "v${version}";
    hash = "sha256-eDd7Bg8CC4bxrlEvHFLGKbbM42eNNKTYKQCBQf+Typ4=";
  };

  extraBuildInputs = [
    libgit2
    extra-cmake-modules
    ki18n
    kio
    kidletime
    kxmlgui
    kcmutils
    libplasma
    plasma5support
    kcontacts
    ktexttemplate
    akonadi
    akonadi-contacts
  ];

  meta = {
    license = lib.licenses.gpl2Plus;
    teams = [ ];
    description = "Kraft helps to handle your daily quotes and invoices in your small business.";
    maintainers = [ lib.maintainers.dshatz ];
    mainProgram = "kraft";
  };
}
