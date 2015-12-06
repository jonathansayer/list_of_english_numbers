require "rails_helper"

feature 'numbers list' do

  context'selecting the number you want and the numbers per page' do

    before(:each) do
      visit '/numbers'
      fill_in("Number", :with => "5")
    end

    scenario 'should display a prompt to enter a number to generate list' do
      visit '/numbers'
      expect(page).to have_content "Number: "
    end

    scenario 'should allow a user to enter a number a receive a list' do
      click_button "Generate List"
      expect(page).to have_content 'five'
      expect(page).to have_content 'four'
      expect(page).to have_content 'three'
      expect(page).to have_content 'two'
      expect(page).to have_content 'one'
    end

    scenario 'should allow a user to enter a number of pages' do
      fill_in("number_per_page", :with => 3)
      click_button "Generate List"
      expect(page).to have_content 'three'
      expect(page).to_not have_content 'four'
    end

    scenario 'should default to 5 pages per page' do
      fill_in("number_per_page", :with => 100)
      click_button "Generate List"
      expect(page).to have_content "five"
      expect(page).to_not have_content 'six'
    end
  end

  context 'large numbers' do

    scenario 'when selecting large numbers' do
      visit '/'
      fill_in("Number", :with => "101")
      fill_in("number_per_page", :with => 101)
      click_button "Generate List"
      expect(page).to have_content 'one hundred and one'
      expect(page).to have_content 'one hundred'
      expect(page).to have_content 'ninety nine'
      expect(page).to have_content 'ninety eigth'
      expect(page).to have_content 'ninety seven'
    end
  end

end
