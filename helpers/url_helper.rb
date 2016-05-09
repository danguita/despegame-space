module UrlHelper
  def absolute_url_for(source)
    config.protocol + host_with_port + source
  end

  def host_with_port
    [config.host, port].compact.join(":")
  end

  def port
    config.port unless config.port.to_i == 80
  end
end
