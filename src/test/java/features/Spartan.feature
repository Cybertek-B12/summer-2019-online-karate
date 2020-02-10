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
    Then assert response.success == 'A Spartan is Born!'
    * print response

#    PATCH - partial update of existing entity (object)

  @patch_spartan
  Scenario: Patch existing spartan
    Given path '/api/spartans/183'
    And request {name:'New_Spartan'}
    When method patch
    Then print response
    And status 204

#PUT requires all parameters, wheres PATCH one ore more
  @update_spartan
  Scenario: Update existing spartan
    Given path '/api/spartans/183'
    And request {name:'New_Spartan'}
    When method put
    Then print response
    And status 204
