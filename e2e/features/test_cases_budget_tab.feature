@@budget_tab
Feature: Testing Budget Tab for Modus

  Background:
  Given I am on the modus budget app in the Budget tab

  @income
  Scenario: Testing that adding an income to budget works correctly
    Given I add an Income of 100
    When I click the Add button
    Then I expect the entry to be added with the correct details
    And I expect the total inflow to increase
    And the working balance should increase

  @field_validation
  Scenario Outline: Test validation in Value field
    When I type a non-numeric <characters> into the value field
    Then the Add button is disabled
    Examples:
      |characters|
      |@!$£     |
      |AbYz     |
      |123      |

  @expenses
  Scenario: Test that adding expenses to budget works correctly
    Given  I add a Taxes Expense of 100
    When I click the Add button
    Then I expect the entry to be added with the correct details
    And I expect the total outflow to increase
    And the working balance should decrease






