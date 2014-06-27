require 'rails_helper'

describe User do

  before do
    @user = new_user
    expect(@user).to be_valid
  end

  it 'must have a name' do
    @user.name = ""
    expect(@user).to_not be_valid
  end

  it 'must have a valid email' do
    @user.email = 'test'
    expect(@user).to_not be_valid
  end

  it 'must have a unique email' do
    @user.save
    user_1 = new_user(name: 'Jay',
        email: 'jay@example.com',
        password: 'password'
    )

    expect(user_1).to_not be_valid
  end

  it 'password must be at least 8 characters' do
    @user.password = '1234567'
    expect(@user).to_not be_valid
  end

end
