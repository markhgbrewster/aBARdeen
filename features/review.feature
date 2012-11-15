Feature: Review

    Scenario: Creating and deleting a review
        Given that the user is logged in
        And he sees Signed in as test
        And he visits the venue number 1
        Then he should see the option of adding a new review
        When he clicks to add a new review
        And he lands on the add a new review page
        And he submits the review
        Then the review should be created
        When the user deletes a review
        Then the review should be deleted