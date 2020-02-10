@spartan
Feature: practice with spartan app

  Background: setup
    * url 'http://3.87.83.231:8000'

  Scenario: Get all spartans
    Given path '/api/spartans'
    When method get
    Then status 200
    And print response


  Scenario: Add new spartan and verify status code 201
    Given path '/api/spartans'
    * def spartan =
    """  
      {
      "name": "Karate_Master",
      "gender": "Male",
      "phone": 1212339999999
      }
    """
    * request spartan
    When method post
    Then status 201

#    120 - user id to delete
  @delete_spartan
  Scenario: Delete spartan
    Given path 'api/spartans/120'
    When method delete
    Then status 204
    * print response

  @add_spartan_with_external_json
  Scenario: Add new spartan by reading external JSON payload
    Given path '/api/spartans'
    * def spartan = read('../test_data/payloads/spartan.json')
    * request spartan
    When method post
    Then status 201
    * print response