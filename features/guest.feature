Feature: Guest
  
  Scenario: Visiting home page
    Given a user visits the home page
    And he should see a sign in link
    And he clicks Venues link
    Then he should see a list of venues
    When he clicks show link