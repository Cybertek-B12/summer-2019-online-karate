@bookit
Feature: bookit tests

  Background:
    * url 'https://cybertek-reservation-api-qa.herokuapp.com'
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true

  Scenario: Verify status code 401 when accessing all rooms without valid authentication token
    Given path '/api/rooms'
    When method get
    Then status 401