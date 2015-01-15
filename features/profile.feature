Feature: Profile
  In order users can show and edit profiles

  Background:
    Given a user with email: "user@example.com" first name: "Gosha"
      And I signed in as user with email "user@example.com"


  Scenario: Show my profile
    When I go to "/cabinet"
    And I click on menu item "profile"
    Then I should see my profile
    And I should see first name: "Gosha"

  Scenario: Edit my profile
    When I go to "/cabinet"
    And I click on menu item "profile"
    And I click on link "edit"
    And I fill up input "first_name" as "Lena" in the form "edit_user"
    And I submit form "edit_user"
    Then I should be redirected to my profile
    And I should see first name: "Lena"
