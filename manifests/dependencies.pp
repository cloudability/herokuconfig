class herokuconfig::dependencies {
  $deps = hiera("dependencies")

  package { "heroku-api",
      ensure   => $deps["heroku-api"],
      provider => "gem",
  }
}
