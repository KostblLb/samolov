Feature:
  In order a student can send message to classmates


  Background:
    Given a course "Cucumber. The Return of the king"
      And a group with teacher: "dr.popov@example.com", students: "sender@example.com recipient@example.com"

  Scenario: Send message
    Given I signed in as "sender@example.com"
    When I select menu item "courses"
    And I select course "Cucumber. The Return of the king"
    And I open right sideber
    And I click to send message to recipient@example.com
    And I fill uo input "text" as "hi" in the form "new_message"
    And I submit form "new_message"
    Then a new message should be created with sender "sender@example.com" and recipient "recipient@example.com"

  Scenario: Recive message
    Given I signed in as "recipient@example.com"
    And a message with text: "Hi", sender: "sender@example.com", recipient: "recipient@example.com"
    When I select menu item "messages"
    Then I should see a new message from "sender@example.com"