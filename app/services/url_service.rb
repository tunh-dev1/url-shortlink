class UrlService
  def initialize(url = nil)
    @url = url
  end

  def encode
    shorted_url = generate_unique_shorted_url
    create_url(shorted_url)
    shorted_url
  end

  def decode(shorted_url)
    url_record = Url.find_by(shorted_url: shorted_url)
    url_record&.original_url
  end

  private

  def generate_unique_shorted_url
    loop do
      shorted_url = SecureRandom.alphanumeric(6)
      break shorted_url unless Url.exists?(shorted_url: shorted_url)
    end
  end

  def create_url(shorted_url)
    Url.create(original_url: @url, shorted_url: shorted_url)
  end
end
