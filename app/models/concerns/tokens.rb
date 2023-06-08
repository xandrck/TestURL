module Tokens
  private

  def generate_token
    tokens = Url.pluck(:token)

    loop do
      token = SecureRandom.hex(8)
      return self.token = token unless tokens.include?(token)
    end
  end
end
