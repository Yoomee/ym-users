Feature: Manage my user profile
  As a visitor to the website
  I want to be able to sign up and manage my profile
  In order to participate in the site

  Scenario: Signing up
    Given a new user
    When I go to the sign up page
    And I sign up
    Then I see the welcome flash

  Scenario: Signing in
    Given a user
    When I sign in
    And I go to my profile
    Then I see my details

  Scenario: Editing my profile
    Given a user
    And that I am logged in
    When I edit my details
    And I see my details
