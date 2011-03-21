class LudusUrl
  attr_reader :url
  def initialize(requested_url, requested_path, destination_url)
    @url = requested_url.sub(/#{Regexp.escape(requested_path)}$/, '') + destination_url 
  end
end