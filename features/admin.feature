Feature: Admin
  
  Scenario: Admin log in
    Given the admin is on the home page
    Then he should see the admin sign in link
    When he clicks the admin link
    Then he should be on the admin sign in page
    When he signs in as admin
    Then he should be logged in
    
   Scenario: Admin updates database
    Given the admin clicks the update database link
    Then he should be on the create venues page
    When he clicks to create venues
    Then the venues should be updated