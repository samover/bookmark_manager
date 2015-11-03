feature "create links" do
  scenario "it adds a link, title and url to Bookmark Manager" do
    visit('/')
    click_button('Add bookmark')
    fill_in('title', with: 'Makers Academy')
    fill_in('url', with: 'www.makersacademy.com')
    click_button('Add bookmark')
    click_button('View links')
    expect(page).to have_content('Makers Academy')
  end
end