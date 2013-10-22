Puppet::Type.newtype(:herokuconfig_type) do
  @doc = 'Retrieves Heroku config for a given app and populates a file with it'

  ensurable do
    defaultvalues
    defaultto(:present)
  end

  newparam(:heroku_api_key) do
    desc 'Heroku API Key'
    isrequired
  end

  newparam(:heroku_app_name) do
    desc 'Heroku application name'
    isrequired
    isnamevar
  end

  newparam(:path) do
    desc 'Full path where this file is to be stored.'
    isrequired
  end
end
