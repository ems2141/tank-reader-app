require 'rails_helper'

describe User do

  before do
    @user = User.new(
        name: 'Jay',
        email: 'jay@text.com',
        password: 'password'
    )
    expect(@user).to be_valid
  end

  it 'must have a name' do
    @user.name = ""
    expect(@user).to_not be_valid
  end

end
