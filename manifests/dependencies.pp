class herokuconfig::dependencies {
  package {
    "herokuconfig_heroku-api":
      name     => "heroku-api",
      ensure   => hiera("dependencies")["heroku-api"],
      provider => "gem";

    "herokuconfig_excon":
      name     => "excon",
      ensure   => hiera("dependencies")["excon"],
      provider => "gem";
  }
}
