require 'nokogiri'
require 'page-object'
require 'watir'

class BudgetPage

  def initialize(browser)
    @browser = browser
  end

  def category_dropdown
    @browser.select_list(:name, "categoryId")
  end

  def description_field
    @browser.text_field(:name => "description")
  end

  def value_field
    @browser.text_field(:name => "value")
  end

  def budget_table
    page = Nokogiri::HTML.parse(@browser.html)
    page
    page.search('tr').each do |tr|
      cells = tr.search('th, td')
      cells
      # output cell data
    end
    # row_1 = doc.xpath('//*[@id="root"]/main/section/table/tbody/tr[1]')
    # row_1
  end

  def add_entry_to_budget(category, description, value)
    select_category(category)
    description_field.set description
    value_field.set value
  end

  def select_category(category)
      options_array = category_dropdown.options.map(&:value)
      category_dropdown.click
      item = category_dropdown.select_value(options_array[category])
      return item
  end

  def click_add_button
    submit_button = @browser.button(:type => "submit")
    submit_button.click
  end

  def return_budget_as_array
    puts budget_table
  end
end


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
  # def add_button
  #   @browser.button(:add, :value => 'Add')
  # end


