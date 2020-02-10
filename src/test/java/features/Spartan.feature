@spartan
Feature: practice with spartan app

    Background: setup
      * url 'http://3.87.83.231:8000'

    Scenario: Get all spartans
      Given path '/api/spartans'
      When method get
      Then status 200