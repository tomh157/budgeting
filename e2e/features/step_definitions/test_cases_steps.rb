require 'watir'
require 'waitutil'
require_relative '../page_objects/budget_tab.rb'

# class TestSteps
#
  def Initialize
     @budget_page = BudgetTab.new
  end
#
#   @starting_total_inflow =
#   @starting_total_outflow =
#   @starting_working_balance =

  Given(/^I am on the modus budget app in the Budget tab$/) do
    @browser = Watir::Browser.new :chrome
    @browser.goto "https://budget.modus.app/#/budget"
    @browser.text_field(name: "description").wait_until_present(10)

    puts @browser.url
  end

  And(/^I add an Income of \$(\d+)$/) do |value|
    budget_page = BudgetTab.new
    budget_page.category_field('15')
    # budget_page.description = create_random_description
    # budget_page.value = value
    # puts create_random_description
  end
  # And(/^I add an Income of $(\d+)$/) do |value|
  # end
  #
  # When(/^I click the Add button$/) do
  #   budget_page = BudgetTab.new
  #   budget_page.add_button.click
  # end
  #
  # Then(/^I expect the entry to be added to the budget$/) do
  #   pending
  # end
  #
  # def create_random_description
  #   range = [*'0'..'9',*'A'..'Z',*'a'..'z']
  #   Array.new(8){range.sample}.join
  #  end
  # end



