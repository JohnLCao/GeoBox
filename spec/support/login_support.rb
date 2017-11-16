module LoginSupport
  def login(user)
    # user = User.where(:login => user.to_s).first if user.is_a?(Symbol)
    request.session[:user_id] = user.id
  end

  def login_as_admin
    admin = FactoryBot.create(:admin)
    login(admin)
  end

end

RSpec.configure do |config|
  config.include LoginSupport
end
