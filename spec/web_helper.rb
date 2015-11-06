def sign_up (username: 'matsam', email: 'matsam@makers.com', password: '123abc', password_confirmation: '123abc')
  visit ('/users')
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button('Sign Up')
end

def sign_in(email: 'matsam@makers.com', password: '123abc')
  visit '/sessions/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button('Sign In')
end 
