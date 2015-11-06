feature 'User sign in' do
  scenario 'a user can sign in and sees a welcome message' do
    sign_up(email: 'potato@patat.org', username: 'potato')
    sign_in(email: 'potato@patat.org')
    expect(page).to have_content('Welcome potato!')
  end
end
