Feature: Review

    Scenario: Creating and deleting a review
        Given that the user is logged in
        Then he should see Signed in as test
        When he visits the venue show page
        Then he should see the option of adding a new review
        When he clicks to add a new review