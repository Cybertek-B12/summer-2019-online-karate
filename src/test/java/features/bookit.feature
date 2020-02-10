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
    And print response[0].name


#put some other email, otherwise it will not work
#  bookit requires unique email address
#    {{qa1_url}}/api/students/student?first-name&last-name&email&password&role&campus-location&batch-number&team-name
  @add_new_student
  Scenario: Add new student
    Given path '/api/students/student'
    * header Authorization = token
    * params {first-name:'Paul', last-name:'George', email:'pgeorge@email.com', password:'1111', role:'student-team-member', campus-location:'VA', batch-number: 12, team-name:'Online_Hackers'}
    * request 'test'
    When method post
    Then status 201
    And print response

  @scenario_outline_bookit
  Scenario Outline: Verify that room <room_name> has id <id>
    Given path '/api/rooms/<room_name>'
    * header Authorization = token
    When method get
    Then match response contains {id: <id>}

    Examples: rooms info
      | id  | room_name |
      | 112 | harvard   |
      | 113 | yale      |
      | 114 | princeton |