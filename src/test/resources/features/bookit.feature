Feature: bookit tests

  Background:
    * url 'https://cybertek-reservation-api-qa.herokuapp.com'

  Scenario: Verify status code 401 when accessing all rooms without valid authentication token
    Given path '/api/rooms'
    When method get
    Then status 401