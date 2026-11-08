{
  lib,
  python3Packages,
  fetchFromGitHub,
}:

let
  pythonPackages = python3Packages;
in
pythonPackages.buildPythonApplication (finalAttrs: {
  pname = "mcp-google-analytics";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "googleanalytics";
    repo = "google-analytics-mcp";
    tag = finalAttrs.version;
    hash = "sha256-otPsWnaEzHNr9rz+pbd+QbMomF9CVGVL1dcr7YbV+6s=";
  };

  pyproject = true;

  build-system = [ pythonPackages.setuptools ];

  dependencies = with pythonPackages; [
    google-analytics-data
    google-analytics-admin
    google-auth
    google-adk
    mcp
    httpx
  ];

  doInstallCheck = true;


  meta = {
    description = "Google Analytics MCP Server";
    homepage = "https://github.com/googleanalytics/google-analytics-mcp";
    mainProgram = "google-analytics-mcp";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ dshatz ];
  };
})
