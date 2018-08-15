require 'page-object'

class BudgetTab

  def Initialize
    @browser = Watir::Browser.new :chrome
    @page_objects = PageObject::Elements
  end

  include PageObject

  def total_outflow

  end

  def working_balance

  end

  def category_field(value)
    @page_objects.select_list(:category, :name => 'categoryId', :selected_values => value)
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

