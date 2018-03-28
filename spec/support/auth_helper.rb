module AuthHelper
  # Method emulates login process
  def sign_in
    user = FactoryBot.create :user

    user&.authenticate(user.password)
    session[:user_id] = user.id
  end

  # Method send POST request with credentials to login
  def sign_in_real
    user = FactoryBot.create :user

    post login_url, params: {name: user.name, 
      password: user.password}
  end
end

RSpec.configure do |config|
  config.include AuthHelper
end
