require 'page-object'
require 'watir'

class BudgetPage

  def initialize(browser)
    @browser = browser
  end

  def add_income(description)
    select_category(15)
    # @browser.select_list(:name => "category").set 15
    @browser.text_field(:name => "description").set description
  end

  def select_category(category)
    list_items = @browser.select_list(:name => "categoryId").click
    puts list_items
    list_items.each do |item|
      if item.value == category
        item.click
        return
      end
    end
  end

  #
  # budget_page.text_field(:description, :name => 'description')
  #
  # def add_income_to_budget(income)
  #   self.description = income
  # end


  # def Initialize
  #   # @browser = Watir::Browser.new :chrome
  #   @page_objects = PageObject::Elements.new
  # end
  #
  # def total_inflow
  #   @page_objects.select("root > main > section > div > div > div:nth-child(1) > div > div.sG1fB._1yrus")
  # end
  #
  # def total_outflow
  #
  # end
  #
  # def working_balance
  #
  # end
  #
  # def category_field(value)
  #   @page_objects.select_list(:category, :name => 'categoryId', :selected_values => value)
  # end
  #
  # def description_field
  #   @page_objects.text_field(:description, :name => 'description')
  #   puts :description
  # end
  #
  # def value_field
  #   @browser.text_field(:value, :name => 'value')
  # end
  #
  # def add_button
  #   @browser.button(:add, :value => 'Add')
  # end
end

