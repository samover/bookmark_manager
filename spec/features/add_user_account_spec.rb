feature "add new user" do
  scenario "it adds a new user with username, email and password" do
    expect { sign_up(email: 'me@me.com', username: 'matsam') }.to change{User.count}.by(1)
    expect(page).to have_content "Welcome matsam!"
    expect(User.first.email).to eq 'me@me.com'
  end

  scenario "it shows an error message when passwords don\'t match" do
    expect { sign_up(password_confirmation: 'abc123') }.not_to change {User.count}
    expect(page).to have_content('Passwords don\'t match: please reenter your password')
  end

  scenario "user cannot sign up without an email address" do
    expect { sign_up(email: '') }.not_to change{User.count}
  end
end
