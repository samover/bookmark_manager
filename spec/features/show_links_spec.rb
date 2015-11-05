feature 'Homepage shows a list of links' do

  scenario 'shows list of urls' do
    Link.create(title: 'Google', url: 'www.google.co.uk')
    visit('/')
    click_button('Login')
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

end
