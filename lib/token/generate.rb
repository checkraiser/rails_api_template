##
# Token generator
class Token::Generate
  def call
    loop do
      model.authentication_token = base64_generator.base64(64)
      break unless repo.find_by(authentication_token: model.authentication_token)
    end
    model.save
    model
  end
end
