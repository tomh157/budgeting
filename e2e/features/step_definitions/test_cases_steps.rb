require 'watir'
require 'waitutil'
require_relative '../page_objects/budget_tab.rb'

# categories = Hash.new
categories = {"Groceries" => 1, "School" => 2, "Entertainment" => 3, "Utensils" => 4, "Kids" => 5, "Income" => 14}

  # budget_page = BudgetPage.new(browser)
   # @starting_total_inflow =
#   @starting_total_outflow =
#   @starting_working_balance =


  Given(/^I am on the modus budget app in the Budget tab$/) do
    @browser = Watir::Browser.new :chrome
    @browser.goto "https://budget.modus.app/#/budget"
    @browser.text_field(name: "description").wait_until_present(10)

    puts @browser.url
  end

  And(/^I add an (.*) of (.*)$/) do |category, value|
    @budget_page = BudgetPage.new(@browser)
    @budget_page.add_entry_to_budget(categories[category], create_random_description, value)
    sleep (10)
    @category = category
    @value = "$#{value}.00"
  end

  When(/^I click the Add button$/) do
    @budget_page.click_add_button
  end

  Then(/^I expect the entry to be added with the correct details$/) do
    @budget_page.assert_new_entry(@category, @description, @value)
  end

  def create_random_description
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']
    random_description = Array.new(8){range.sample}.join
    @description = "Test #{random_description}"
  end



