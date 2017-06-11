class UserCreator

  def initialize(info)
    @provider  = info['provider']
    @uid       = info['uid']
    @email      = info['info']['email']
    @first_name = info['info']['first_name']
    @last_name  = info['info']['last_name']
  end

  def call
    authentication = Authentication.find_by(@auth_info)
    if authentication && authentication.user
      authentication.user
    else
      authentication = Authentication.create!(provider: @provider, uid: @uid)
      user = User.find_by(email: @email)
      if user
        authentication.user = user
        authentication.save
      else
        user = authentication.create_user(email: @email, first_name: @first_name, last_name: @last_name)
      end
      user.activate!
      user
    end
  end

end