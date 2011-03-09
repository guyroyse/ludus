class LudusUrl
  attr_reader :url
  def initialize(requested_url, requested_path)
    @url = requested_url.sub(/#{Regexp.escape(requested_path)}$/, '') + '/ludus.html' 
  end
end