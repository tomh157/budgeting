Feature: Testing Modus Budgeting App

#  Scenario: Testing that adding an income to budget works correctly
#    Given I am on the modus budget app in the Budget tab
#    And I add an Income of 100
#    When I click the Add button
#    Then I expect the entry to be added with the correct details
#
#  Scenario Outline: Test validation in Value field
#    Given I am on the modus budget app in the Budget tab
#    When I type a non-numeric <characters> into the value field
#    Then the Add button is disabled
#    Examples:
#      |characters|
#      |@!$£     |
#      |AbYz     |
#      |123      |

  Scenario: Test deleting an expense from the budget
    Given I am on the modus budget app in the Budget tab
    And  I add a Taxes Expense of 100
    When I delete the entry from the budget
    Then the entry no longer exists on the page





