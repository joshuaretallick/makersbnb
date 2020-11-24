feature 'sign up to Makersbnb' do
  scenario 'user can create a profile on Makersbnb if they dont already have one' do
    visit '/'
    fill_in('email', with: 'test@test.co.uk')
    fill_in('password', with: 'passwordtest')
    click_button('Sign up')
    expect(current_path).to eq '/property'
  end
end
