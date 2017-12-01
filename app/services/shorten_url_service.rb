class ShortenUrlService
  def self.call(original_url)
    SecureRandom.uuid[0..7] + Digest::MD5.hexdigest(original_url)[-2..-1]
  end
end