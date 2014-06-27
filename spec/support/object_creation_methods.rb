def create_user(attributes = {})
  user = new_user(attributes)
  user.save!
  user
end

def new_user(attributes = {})
  defaults = {
      name: 'Jay',
      email: 'jay@example.com',
      password: 'password',
  }
  User.new(defaults.merge(attributes))
end