feature 'Viewing Properties' do
  scenario 'user can view all listed properties' do
    Property.create(name: "house", description: "small, 3 rooms", cost: 50)
    Property.create(name: "castle", description: "big, cold, stoney", cost: 200)
    Property.create(name: "tent", description: "Intense", cost: 25)
    visit('/property')
    expect(page).to have_content("house")
    expect(page).to have_content("big, cold, stoney")
    expect(page).to have_content("£25")
  end
end
