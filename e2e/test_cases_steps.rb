require 'watir-webdriver'
require '../page_objects/budget_tab.rb'

class TestSteps


  Given /^Given I am on the modus budget app in the Budget tab$/ do
    @browser = Watir::Browser.new :chrome
    @browser ||= Watir::Browser.new :chrome
    @browser.goto "google.com"
    @browser.text_field(:name => "sbtc").set "https://budget.modus.app/#/budget"
    @browser.button(name: 'btnK').click
    puts browser.url
  end


  And(/^I select Income from the Category dropdown$/) do
    budget_page = BudgetTab.new
    budget_page.description = create_random_description
    budget
  end

  def create_random_description
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']Array.new(8){range.sample}.join
  end
end


