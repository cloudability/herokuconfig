# Herokuconfig

Puppet module that reads config variables from Heroku apps and writes them a
file

## Examples

### Single file download without credentials

    herokuconfig { 'my-heroku-app':
      heroku_api_key => "api-key",
      heroku_app_name => 'my-heroku-app',
      path => '/var/www/.env',
    }

This will populate the .env file with following:
```
VAR1=VALUE1
VAR2=VALUE2
```
