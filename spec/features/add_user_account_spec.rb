feature "add new user" do
  scenario "it adds a new user with username, email and password" do
    expect { sign_up(email: 'me@me.com', username: 'matsam') }.to change{User.count}.by(1)
    expect(page).to have_content "Please Sign in"
    expect(User.first.email).to eq 'me@me.com'
  end

  scenario "it shows an error message when passwords don\'t match" do
    expect { sign_up(password_confirmation: 'abc123') }.not_to change {User.count}
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario "user cannot sign up without an email address" do
    expect { sign_up(email: '') }.not_to change{User.count}
    expect(current_path).to eq '/users/new'
  end

  scenario 'user cannot sign up with an invalid email address' do
    expect { sign_up(email: 'bogus@email') }.not_to change{User.count}
    expect(current_path).to eq '/users/new'
  end

  scenario 'a user cannot sign up with an email that is already registered' do
    sign_up
    expect { sign_up }.not_to change{User.count}
    expect(current_path).to eq '/users/new'
    expect(page).to have_content('Email is already taken')
  end
end
