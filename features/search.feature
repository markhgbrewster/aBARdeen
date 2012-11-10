Feature: Search
  
  Scenario: Searching for a bar
    Given a user is on the home page
        And he sees the search box
    When he searches for bars called Abbot
    Then he should see the result as Abbot