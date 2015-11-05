feature 'Filter the tag' do
  scenario 'filters links by tag' do
    Link.create(title: 'Makers', url: 'makers.com', tags: [Tag.create(name: 'bootcamp')])
    Link.create(title: 'Amazon', url: 'amazon.com', tags: [Tag.create(name: 'shopping')])
    Link.create(title: 'Fruit Punch', url: 'punch.com', tags: [Tag.create(name: 'bubbles')])
    Link.create(title: 'Potatoes', url: 'patat.com', tags: [Tag.create(name: 'bubbles')])

    visit '/tags/bubbles'
    expect(page).not_to have_content('Makers')
    expect(page).not_to have_content('Amazon')
    expect(page).to have_content('Fruit Punch')
    expect(page).to have_content('Potatoes')
  end
end
