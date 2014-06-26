require 'rails_helper'

describe User do

  before do
    @user = User.new(
        name: 'Jay',
        email: 'jay@test.com',
        password: 'password'
    )
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
    user_1 = User.new(name: 'Jay',
        email: 'jay@test.com',
        password: 'password'
    )

    expect(user_1).to_not be_valid
  end

end
