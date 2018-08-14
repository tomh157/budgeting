require 'PageObjects'

class BudgetTab
  #
  # def Initialize
  #   PageObjects = Class:PageObject::Elements
  # end
  include PageObjects
  select_list(:category, :name => 'categoryId')
  text_field(:description, :name => 'description')
  text_field(:value, :name => 'value')
  button(:add, :value => 'Add')
end

