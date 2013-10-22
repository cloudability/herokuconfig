class herokuconfig::dependencies {
  $deps = hiera("dependencies")

  package {
    "herokuconfig_heroku-api":
      name     => "heroku-api",
      ensure   => $deps["heroku-api"],
      provider => "gem";

    "herokuconfig_excon":
      name     => "excon",
      ensure   => $deps["excon"],
      provider => "gem";
  }
}
