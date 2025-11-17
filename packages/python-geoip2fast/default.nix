{
  lib,
  python3Packages,
  _sources',
}:

python3Packages.buildPythonApplication {
  inherit (_sources' ./.) pname version src;
  pyproject = true;

  build-system = [
    python3Packages.setuptools
    python3Packages.wheel
  ];

  pythonImportsCheck = [ "geoip2fast" ];

  meta = {
    description = "GeoIP2Fast is the fastest GeoIP2 country/city/asn lookup library that supports IPv4 and IPv6. A search takes less than 0.00003 seconds. It has its own data file updated twice a week with Maxmind-Geolite2-CSV, supports IPv4/IPv6 and is Pure Python";
    homepage = "https://pypi.org/project/geoip2fast/";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
  };
}
