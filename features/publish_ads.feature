Feature: Publish ads
  In order group leader can publish ads and students can see its

  Background:
    Given a group "1B" with teacher: "gubka@example.com"
      And a student of group "1B" with email "bob@example.com"

  Scenario: Teacher publish ad
    Given I signed in as user "gubka@example.com"
    When I go to "cabinet"
    And I go click on menu items "groups"
    And I click on group "1B"
    And I fill up input "text" as "Who lives in a pineapple under the sea" in the form "new_ad"
    And I click on button "publish new ad"
    Then I should see new ad on ads list

  Scenario: Students can see new ads
    Given I signed in as user "bob@example.com"
      And a ad with text: "Who lives in a pineapple under the sea" in group "1B" from "gubka@example.com"
    When I go to "cabinet"
    And I go click on menu items "ads"
    Then I should see one ad