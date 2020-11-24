feature 'authentication' do
  it 'a user can sign in' do
    User.create(email: 'mario@mario.com', password: 'mario')
    visit '/sessions/new'
    fill_in(:email, with: 'mario@mario.com')
    fill_in(:password, with: 'mario')
    click_button('Sign in')
    expect(page).to have_content 'Welcome, Mario Mario'
  end

end 
