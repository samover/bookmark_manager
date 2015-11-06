
feature "add new user" do
  scenario "it adds a new user with username, email and password" do
    expect { sign_up(email: 'me@me.com' ) }.to change{User.count}.by(1)
    expect(page).to have_content "Welcome #{username}!"
    expect(User.first.email).to eq 'me@me.com'
  end
