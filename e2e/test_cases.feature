Feature: Testing Modus Budgeting App

  Scenario: Testing that adding an income to budget works correctly
    Given I am on the modus budget app in the Budget tab
    And I select Income from the Category dropdown
    And I enter a value in the description field
    And a value of 100 in the Value field
    When I click the Add button
    Then I expect the entry to be added to the budget
    And the total inflow in Green to increase by $100
    And the working balance to increase by $100



