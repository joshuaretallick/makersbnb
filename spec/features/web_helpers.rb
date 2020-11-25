def sign_in
  User.create(email: 'mario@mario.com', password: 'mario')
  visit '/sessions/new'
  fill_in(:email, with: 'mario@mario.com')
  fill_in(:password, with: 'mario')
  click_button('Sign in')
end
