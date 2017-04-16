# feature "Some JavaScript Stuff" do
#   scenario "load homepage", :js => true do
#     visit "/"
#     expect(page).to have_content "some content enabled by javascript"
#   end
# end

describe "homepage ", :type => :feature do
#   before :each do
#     User.make(email: 'user@example.com', password: 'password')
#   end

  it "signs me in" do
    visit '/'
    # within("#session") do
    #   fill_in 'Email', with: 'user@example.com'
    #   fill_in 'Password', with: 'password'
    # end
    # click_button 'Sign in'
    expect(page).to have_content 'Success'
  end
end