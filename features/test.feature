Feature: home page
 
  As a user
  So that I can login or signup
  I want to login or sign up
 
Background: 
 
  Given the following users exist:
 | Rice   |   10000@tamu.edu   |    123456  |

 
Scenario: home page
  Given I am on the home page
  Then I should see "Diagle System"
  And I should see "Log in"
  And I should see "Sign up"
  And I should see "Sign up now"
  And I should see "Users"

Scenario: sign up page
  Given I am on the home page
  When I follow "Sign up"
  Then I should be on signup page
  And I should see "Sign up for Diagle System"
  
Scenario: Sign up successful
  Given I am on the signup page
  And I fill in "Username" with "Rice"
  And I fill in "Email" with "10000@gmail.com"
  And I fill in "Password" with "123456"
  When I press "Sign up"
  Then I should be on users page
  And I should see "Welcome to Rice's page"
  And I should see "Rice's activities"
  And I should see "Log out"
  And I should see "Your Profile"
  And I should see "Back to home"

Scenario: Sign up fails 1-not complete
  Given I am on the signup page
  When I press "Sign up"
  Then I should be on the signup page
  And I should see "Username can't be blank"
  And I should see "Username is too short"
  And I should see "Email can't be blank"
  And I should see "Email is invalid"
  And I should see "Password can't be blank"

Scenario: Sign up fails 2-duplicate nams
  Given I am on the sign up page
  And I fill in "Username" with "Rice"
  And I fill in "Email" with "10000@gmail.com"
  And I fill in "Password" with "123456"
  When I press "Sign up"
  Then I should be on signup page
  And I should see "Username has already been taken"
  And I should see "Email has already been taken"

Scenario: Log out
  Given I am on the users page
  When I follow "Log out"
  Then I should be on the home page
  And I should see "You have been logged out"

Scenario: Log in page
  Given I am on the home page 
  When I follow "Log in"
  Then I should be on the login page
  And I should see "Log in"

Scenario: Log in
  Given I am on the login page
  And I fill in "Email" with "10000@tamu.edu"
  And I fill in "Password" with "123456"
  When I press "Log in"
  Then I should be on the users page
  And I should see "You have successfully logged in"
  And I should see "Welcome to Rice's page"

Scenario: Log in fail
  Given I am on the login page
  And I fill in "Email" with "10000@tamu.edu"
  And I fill in "Password" with "12345"
  When I press "Log in"
  Then I should see "There was something wrong with your login information"
   