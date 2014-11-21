
Given(/^From prime factor number$/) do
    visit "http://192.168.33.11:3000/numbers/new"
end

When(/^user enter number$/) do
  #pending # express the regexp above with the code you wish you had#
  # browser.text_field(:id => 'number_prime').set '6'
  fill_in 'number_prime', :with => 4
  click_button("Create Number")

end

Then(/^should display prime factors$/) do
  
  #pending # express the regexp above with the code you wish you had
  assert page.has_content?('Prime Factors :[2, 2]')
  
end


