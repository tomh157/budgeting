Feature: Testing Modus Budgeting App


  Scenario Outline: Testing that adding an income to budget works correctly
    Given I am on the modus budget app in the Budget tab
    And I add an Income of $<value>
    When I click the Add button
    Then I expect the entry to be added with the correct details
    Examples:
      | value |
      | 100   |




