Puppet::Type.type(:herokuconfig).provide(:default) do
  desc('Get config from a Heroku app and put it in a dotenv style file')

  def create
    Puppet.debug("let's download some stuff")
    ensure_writable

    Puppet.debug('requiring heroku gem')
    # require fog here so we can install the gem before ruby/puppet tries to
    # load it
    require 'heroku-api'

    api_key = @resource[:heroku_api_key]
    heroku = Heroku::API.new(:api_key => api_key)
    response = heroku.get_config_vars(@resource[:heroku_app_name])
    output_file = @resource[:path]
    Puppet.debug("writing file #{output_file}")
    File.open(output_file, 'w') do |f|
      response.data[:body].each do |k,v|
        f.puts("#{k}=#{v}")
      end
    end
  end

  def destroy
    Puppet.debug("Nuke it from orbit! [#{local_artifact_name}]")
    File.unlink(local_artifact_name)
  end

  def exists?
    # Since this type's job is to keep this file in sync with Heroku, we always
    # want to fetch the latest
    false
  end

  private

  def ensure_writable(search = nil)
    search = @resource[:path] unless search
    if File.exists?(search)
      raise Puppet::Error, "Path exists but is not writable [#{search}]" unless File.writable?(search)
    else
      parent = Pathname.new(search).parent
      raise Puppet::Error, "Unable to write to path [#{path}]" unless File.writable?(parent)
    end
  end

  # if the provided path is a dir, use the downloaded filename as the output
  # filename
  def local_artifact_name
    @resource[:path]
  end
end
