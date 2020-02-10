@bookit
Feature: bookit tests

  Background:
    * url 'https://cybertek-reservation-api-qa.herokuapp.com'
    * path 'sign'
    * param email = 'teacherva5@gmail.com'
    * param password = 'maxpayne'
    * method get
    * def token = response.accessToken
    * print "Token: ", token

  Scenario: Verify status code 401 when accessing all rooms without valid authentication token (fails, because it return 422)
    Given path '/api/rooms'
    When method get
    Then status 401

#/sign?email=teacherva5@gmail.com&password=maxpayne

  Scenario: Sign in
    Given path 'sign'
    * param email = 'teacherva5@gmail.com'
    * param password = 'maxpayne'
    When method get
    Then status 200
    * def token = response.accessToken
    * print "Token: ", token

  Scenario: Get all rooms with valid token
    Given path '/api/rooms'
    * header Authorization = token
    When method get
    Then status 200
    And print response