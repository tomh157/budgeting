# require 'PageObjects'

class BudgetTab

  def Initialize
    @browser = Watir::Browser.new :chrome
    @PageObjects = Class::PageObject::Elements
  end

  # include PageObjects

  def category_field(value)
    @browser.select(:category, :name => 'categoryId', :value => value)
  end

  def description_field
    @browser.text_field(:description, :name => 'description')
  end

  def value_field
    @browser.text_field(:value, :name => 'value')
  end

  def add_button
    @browser.button(:add, :value => 'Add')
  end
end

