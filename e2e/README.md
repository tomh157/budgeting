**Test Plan for Budgeting App**

*Budget Tab*

Given I am on the modus budget app in the Budget tab
When I type a special character into the description field
Then these characters should appear in the field

Given I am on the modus budget app in the Budget tab
When I type a non-numeric character into the value field
Then the field should remain empty

Given I am on the modus budget app in the Budget tab
And I add an Income of $100
When I click the Add button
Then I expect the entry to be added to the budget
And the total inflow in Green to increase by $100
And the working balance to increase by $100

Given I am on the modus budget app in the Budget tab
And I add an Expense(anything other than income)of $100
When I click the Add button
Then I expect the entry to be added to the budget
And the total outflow in Red to increase by $100
And the working balance to decrease by $100 

Given I am on the modus budget app in the Budget tab
And I add an Income of $100 without a description
When I click the Add button
Then I expect the entry to be added to the budget without a description
And the total inflow in Green to increase by $100
And the working balance to decrease by $100

Given I am on the modus budget app in the Budget tab
And I add an Expense(anything other than income) without a description
When I click the Add button
Then I expect the entry to be added to the budget without a description
And the total outflow in Red to increase by $100
And the working balance to decrease by $100

Given I am on the modus budget app in the Budget tab
And I select an Income from the Category dropdown
And I enter a value in the description field
And I leave the value button blank
When I go to click the Add button
Then the Add button is disabled 

Given I am on the modus budget app in the Budget tab
And I select an Expense(anything other than income) from the Category dropdown
And I enter a value in the description field
And I leave the value button blank
When I go to click the Add button
Then the Add button is disabled 

Given I am on the modus budget app in the Budget tab
When I try to type in invalid characters to the ‘Value’ field
Then the field should remain empty

Given I am on the modus budget app in the Budget tab
And I have existing incomes and expenses in the budget
When I delete an expense from the budget
Then the entry no longer exists on the page
And the Working Balance increases accordingly

Given I am on the modus budget app in the Budget tab
And I have existing incomes and expenses in the budget
When I delete an income from the budget
Then the entry no longer exists on the page
And the Working Balance decreases accordingly


*Reporting Tab*

Given I am on the modus budget app in the Budget tab
And I have existing entries in the budget
When I add an expense with a new category that currently does not exist in the budget
Then this new category should be added to the reports with a new colour
And this new category should exist in both the Reports tabs

Given I am on the modus budget app in the Budget tab
And I add an Income of $100 
And I click the Add button
When I go to the reporting tab
Then the reports should change to reflect this new $100 expense in the Inflow vs Outflow tab


