require 'uri'

class UrlParser
  attr_accessor :new_url, :scheme, :domain, :port, :path, :query_string, :fragment_id

  def initialize(url)
    @new_url = URI::parse(url)
    @scheme = new_url.scheme
    @domain = new_url.host
    @port = new_url.port.to_s
    @query_string = Hash[new_url.query.tr("=&", " ").split(" ").each_slice(2).to_a] unless new_url.query == nil
    @fragment_id = new_url.fragment
    p @port
    return nil if new_url.path == "/"
    @path = new_url.path.delete_prefix("/")
  end
end
