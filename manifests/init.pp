define herokuconfig (
  $heroku_api_key,
  $heroku_app_name = $name,
  $path
) {
  class { 'herokuconfig::dependencies': }

  herokuconfig_type { $title:
    heroku_api_key  => $heroku_api_key,
    heroku_app_name => $heroku_app_name,
    path            => $path,
    require         => Class["herokuconfig::dependencies"],
  }
}