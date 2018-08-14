require 'watir-webdriver'
require '../page_objects/budget_tab.rb'

class TestSteps

  def Initialize
    @PageObjects = Class::PageObject::Elements
  end

  Given(/^I am on the modus budget app in the Budget tab$/) do
    @browser = Watir::Browser.new :chrome
    @browser.goto "google.com"
    @browser.text_field(:name => "sbtc").set "https://budget.modus.app/#/budget"
    @browser.button(name: 'btnK').click
    def loaded?
      @browser.title == "Your Profile"
    end
    puts @browser.url
  end


  And(/^I select Income from the Category dropdown$/) do
    budget_page = BudgetTab.new
    budget_page.category_field('15')
  end
  And(/^I enter a value in the description field$/) do
    budget_page = BudgetTab.new
    budget_page.description = create_random_description
  end

  And(/^a value of (\d+) in the Value field$/) do |value|
    budget_page = BudgetTab.new
    budget_page.value = value
  end

  When(/^I click the Add button$/) do
    budget_page = BudgetTab.new
    budget_page.add_button.click
  end

  Then(/^I expect the entry to be added to the budget$/) do
    pending
  end

  And(/^the total inflow in Green to increase by \$100$/) do
    pending
  end

  And(/^the working balance to increase by \$100$/) do
    pending
  end


  def create_random_description
    range = [*'0'..'9',*'A'..'Z',*'a'..'z']Array.new(8){range.sample}.join
   end
  end



