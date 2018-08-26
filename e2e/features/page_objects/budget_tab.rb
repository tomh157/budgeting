require 'nokogiri'
require 'page-object'
require 'watir'

class BudgetPage

  def initialize(browser)
    @browser = browser
  end

  def category_dropdown
    @browser.select_list(:name => "categoryId")
  end

  def description_field
    @browser.text_field(:name => "description")
  end

  def value_field
    @browser.text_field(:name => "value")
  end

  def add_button
    @browser.button(:type => "submit")
  end

  def budget_table
    page = Nokogiri::HTML.parse(@browser.html)
    page.at('table')
  end

  def return_total_inflow
    working_balance = budget_table.xpath('//*[@id="root"]/main/section/div/div/div[1]/div/div[1]')
    balance = working_balance.text
    balance.gsub(/\D/,'').to_i
  end

  def return_total_outflow
    working_balance = budget_table.xpath('//*[@id="root"]/main/section/div/div/div[3]/div/div[1]')
    balance = working_balance.text
    balance.gsub(/\D/,'').to_i
  end

  def return_working_balance
    working_balance = budget_table.xpath('//*[@id="root"]/main/section/div/div/div[5]/div/div[1]')
    balance = working_balance.text
    balance.gsub(/\D/,'').to_i
  end

  def add_entry_to_budget(category, description, value)
    select_category(category)
    description_field.set description
    value_field.set value
  end

  def select_category(category)
    options_array = category_dropdown.options.map(&:value)
    category_dropdown.click
    category_dropdown.select(options_array[category])
  end

  def click_add_button
    add_button.click
  end

  def return_last_row_values
    last_row = budget_table.xpath('//*/table/tbody/tr')[-1]
    td = last_row.xpath('td')
    div = td.xpath('div')
    category_value_div = div[1].text
    description_value_div = div[3].text
    amount_value_div = div[5].text
    category_value_div + description_value_div + amount_value_div
  end

  def assert_new_entry(category, description, amount)
    expected_row = category + description + amount
    actual_row = return_last_row_values
    if expected_row != actual_row
      raise "expected results do not match actual results"
    end
  end
end









