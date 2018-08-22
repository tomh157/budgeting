Feature: Testing Modus Budgeting App


  Scenario: Testing that adding an income to budget works correctly
    Given I am on the modus budget app in the Budget tab
    And I add an Income of 100
    When I click the Add button
    Then I expect the entry to be added with the correct details
#
#  Scenario: Test validation in Value field
#    Given I am on the modus budget app in the Budget tab
#    When I type a non-numeric character into the value field
#    Then the field should remain empty





