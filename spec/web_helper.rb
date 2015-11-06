def signup (username: 'matsam', email: 'matsam@makers.com', password: '123abc')
  visit ('/signup')
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button('Sign Up')
end
