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
    page.at('table')
  end

  def working_balance
    budget_table.xpath('//*[@id="root"]/main/section/div/div/div[5]/div/div[1]')
  end

  def add_entry_to_budget(category, description, value)
    select_category(category)
    description_field.set description
    value_field.set value
  end

  def select_category(category)
    options_array = category_dropdown.options.map(&:value)
    category_dropdown.click
    category_dropdown.select_value(options_array[category])
  end

  def add_button
    @browser.button(:type => "submit")
  end

  def click_add_button
    add_button.click
  end

  # def return_field_value
  #    value_field = budget_table.xpath('//*[@id="root"]/main/section/table/tfoot/tr/td/form/div[3]/input')
  #    # value_in_field = value_field.xpath(:value)
  #    # value_in_field = budget_table.at('input')['value']
  #    value_in_field = value_field.at('value')
  #
  #    puts value_in_field
  #
  #   # budget_table.(field)
  # end

  def return_last_row
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
    actual_row = return_last_row
    # expected_row.eql? actual_row
    if expected_row != actual_row
      raise "expected results do not match actual results"
    end
  end
end

# def get_table_rows
#     headers = []
#     budget_table.xpath('//*/table/thead/tr/th').each do |th|
#       headers << th.text
#     end
#
# # get table rows
#     rows = []
#     budget_table.xpath('//*/table/tbody/tr').each_with_index do |row, i|
#       rows[i] = {}
#     # strip out first td as this is a repeat of column header
#       td = row.xpath('td')
#       div = td.xpath('div')
#       # value_div = td.xpath('div/class="_3-t-g"')
#       category_value_div = td.xpath('div')[1].text
#       description_value_div = td.xpath('div')[3].text
#       amount_value_div = td.xpath('div')[5].text
#
#       puts "DIV >>>> #{div}"
#       puts "CAT VALUE DIV >>>> #{category_value_div}"
#       puts "DESC VALUE DIV >>>> #{description_value_div}"
#       puts "AMOUNT VALUE DIV >>>> #{amount_value_div}"
#       # row.xpath(div).each_with_index do |div, j|
#       row.xpath('td').each_with_index do |td, j|
#         rows[i][headers[j]] = div.text
#       end
#       puts rows
#     end
#   end







