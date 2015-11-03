feature 'Homepage shows a list of links' do

  scenario 'shows list of urls' do
    Link.create(title: 'Google', url: 'www.google.co.uk')
    visit('/')
    click_button('View links')
    expect(page).to have_content('www.google.co.uk')
  end

end

