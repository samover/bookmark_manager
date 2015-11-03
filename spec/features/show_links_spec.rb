feature 'Homepage shows a list of links' do
  scenario 'shows list of urls' do
    visit('/')
    expect(page).to have_content('www.google.co.uk')
  end
end
