feature "add new user" do
  scenario "it adds a new user with username, email and password" do
    expect { sign_up(email: 'me@me.com', username: 'matsam' ) }.to change{User.count}.by(1)
    expect(page).to have_content "Welcome matsam!"
    expect(User.first.email).to eq 'me@me.com'
  end
end
