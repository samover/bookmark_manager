require './app/models/user'

describe User do
  let(:user) { User.create(email: 'potato@patat.org', username: 'potato', 
                           password: 'abc', password_confirmation: 'abc') }

  it 'authenticates a user when given valid email and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given invalid email or password' do
    expect(User.authenticate(user.email, 'wrong')).to be_nil
  end
end
