class UrlService
  def initialize(url)
    @url = url
  end

  def encode
    shorted_url = generate_unique_shorted_url
    create_url(shorted_url)
    shorted_url
  end

  private

  def generate_unique_shorted_url
    max = 100
    attempt = 0
  
    loop do    
      shorted_url = SecureRandom.alphanumeric(6)
      attempt += 1
      break shorted_url unless Url.exists?(shorted_url: shorted_url)
      raise "Unable to generate a unique shorted URL after #{max} times" if attempt >= max
    end
  end

  def create_url(shorted_url)
    Url.create(original_url: @url, shorted_url: shorted_url)
  end
end
