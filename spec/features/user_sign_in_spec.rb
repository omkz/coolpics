require 'rails_helper'

# describe "the signin process", :type => :feature do
#   before :each do
#     User.new({:email => "paijo@ganteng.com", :username => "ganteng", :password => "111111", :password_confirmation => "111111" }).save(validate: false)
#   end
#
#   it "signs me in" do
#     visit '/users/sign_in'
#
#     fill_in 'Email', with: 'paijo@ganteng.com'
#     fill_in 'Password', with: '111111'
#
#     click_button 'Log in'
#     expect(page).to have_content 'Signed in successfully.'
#   end
# end

feature "Signing in" do
  background do
    User.new({:email => "paijo@ganteng.com", :username => "ganteng", :password => "111111", :password_confirmation => "111111" }).save(validate: false)
  end

  scenario "Signing in with correct credentials" do
    visit '/users/sign_in'

    fill_in 'Email', with: 'paijo@ganteng.com'
    fill_in 'Password', with: '111111'

    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end

  given(:other_user) { User.create(email: 'other@example.com', username: "paijo", password: "111111", password_confirmation: "111111" )}

  scenario "Signing in as another user" do
    visit '/users/sign_in'

    fill_in 'Email', with: other_user.email
    fill_in 'Password', with: other_user.password

    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
end