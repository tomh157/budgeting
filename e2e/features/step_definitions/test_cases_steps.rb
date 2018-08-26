require 'assert'
require 'rubygems'
require 'watir'
require 'waitutil'
require_relative '../page_objects/budget_tab.rb'

categories = {"Groceries" => 0, "School" => 1, "Entertainment" => 2, "Utensils" => 3, "Kids" => 4, "Travel" => 5,
              "Commute" => 6, "Insurace" => 7, "Clothing" => 8, "Car" => 9, "Taxes" => 10, "Health" => 11,
              "Home" => 12, "Beauty" => 13, "Income" => 14, "Misc" => 15, "Gifting" => 16,}

Given(/^I am on the modus budget app in the Budget tab$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto "https://budget.modus.app/#/budget"
  @browser.text_field(name: "description").wait_until_present(10)
  @budget_page = BudgetPage.new(@browser)
  @total_outflow = @budget_page.return_total_outflow
  @total_inflow = @budget_page.return_total_inflow
  @working_balance = @budget_page.return_working_balance
end

And(/^I add an Income of (.*)/) do |value|
  @budget_page.add_entry_to_budget(categories['Income'], create_random_description, value)
  @category = 'Income'
  @amount = "$#{value}.00"
end

And(/^I add a (.*) Expense of (.*)$/) do |category, value|
  @budget_page.add_entry_to_budget(categories[category], create_random_description, value)
  sleep (10)
  @category = category
  @amount = "-$#{value}.00"
end

When(/^I click the Add button$/) do
  @budget_page.click_add_button
end

Then(/^I expect the entry to be added with the correct details$/) do
  @budget_page.assert_new_entry(@category, @description, @amount)
end

And(/^the working balance should increase$/) do
  new_working_balance = @budget_page.return_working_balance
  assert new_working_balance > @working_balance
end

And(/^the working balance should decrease$/) do
  new_working_balance = @budget_page.return_working_balance
  assert @working_balance > new_working_balance
end

When(/^I type a non-numeric (.*) into the value field$/) do |characters|
  @budget_page.value_field.send_keys(characters)
end

And(/^the Add button is disabled$/) do
   if  @budget_page.add_button.enabled?
    raise "Add button is not disabled"
   end
end

And(/^I expect the total outflow to increase$/) do
  new_total_outflow = @budget_page.return_total_outflow
  assert new_total_outflow > @total_outflow
end

And(/^I expect the total inflow to increase$/) do
  new_total_inflow = @budget_page.return_total_inflow
  assert new_total_inflow > @total_inflow
end

def create_random_description
  range = [*'0'..'9',*'A'..'Z',*'a'..'z']
  random_description = Array.new(8){range.sample}.join
  @description = "Test #{random_description}"
end

