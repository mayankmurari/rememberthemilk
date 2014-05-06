Given(/^a user visits signin page$/) do
  visit 'users/sign_in'
end

When(/^they submitt invalid signin information$/) do
  click_button "Sign in"
end

Then(/^they should see a error message$/) do
  expect(page).to have_selector('div.alert.alert-alert')
end

Given(/^the user has an account$/) do
  @user=User.create(email: "mayank@gmail.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa")
end

Given(/^the user submits valid signin information$/) do
  fill_in "user_email", with: @user.email
  fill_in "user_password", with: @user.password
  click_button "Sign in"
end

Then(/^they should see tasks page$/) do
  visit '/tasks'
end