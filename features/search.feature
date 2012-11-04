Feature: Search
  
  Scenario: Searching for a bar
    Given a user is on the home page
        And he sees the search box
    When he searches for bars called Wine
    Then he should see the bars named Wine