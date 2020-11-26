feature 'Viewing Properties' do
  scenario 'user can view all listed properties' do
    sign_in
    Property.create(name: "house", description: "small, 3 rooms", cost: 50, user_id: @user.id)
    Property.create(name: "castle", description: "big, cold, stoney", cost: 200, user_id: @user.id)
    Property.create(name: "tent", description: "Intense", cost: 25, user_id: @user.id)
    visit '/property'
    expect(page).to have_content("house")
    expect(page).to have_content("big, cold, stoney")
    expect(page).to have_content("£25")
  end
end
