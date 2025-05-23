{
  lib,
  python3,
  cargo,
  rustPlatform,
  rustc,
  _sources',
}:
let
  source = _sources' ./.;
in
python3.pkgs.buildPythonApplication {
  inherit (source) pname src version;

  cargoDeps = rustPlatform.importCargoLock source.cargoLock."Cargo.lock";

  nativeBuildInputs = [
    cargo
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
    rustc
  ];

  propagatedBuildInputs = with python3.pkgs; [
    gitpython
    importlib-metadata
    networkx
    prompt-toolkit
    pydot
    pyyaml
    rich
    stdlib-list
    tomli
    tomli-w
  ];

  passthru.optional-dependencies = with python3.pkgs; {
    dev = [
      build
      coverage
      maturin
      pip
      prompt-toolkit
      pyright
      pytest
      pytest-mock
      rich
      ruff
      setuptools
      twine
    ];
  };

  doCheck = false;

  pythonImportsCheck = [ "tach" ];

  meta = with lib; {
    description = "A Python tool to enforce dependencies, using modular architecture 🌎 Open source 🐍 Installable via pip 🔧 Able to be adopted incrementally - ⚡ Implemented with no runtime impact ♾\u{fe0f} Interoperable with your existing systems 🦀 Written in rust";
    homepage = "https://github.com/gauge-sh/tach";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tach";
  };
}
