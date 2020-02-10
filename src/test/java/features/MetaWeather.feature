@meta_weather
Feature: Meta weather tests

  Background: setup base URI
    * url 'https://www.metaweather.com'

  Scenario: Search for London
    Given path '/api/location/search'
    And param query = 'London'
    When method get
    Then status 200
#      verify that first Json object from the payload contains title:'London'
    And match response[0] contains {title:'London'}
#      Verify that every object in the payload contains title:'London'
    And match each response contains {title:'London'}


  Scenario Outline: Verify that by query <query> every title contains <query>
    Given path '/api/location/search'
    And param query = '<query>'
    When method get
    Then status 200
    And match each response contains {title: '<query>'}

    Examples: queries
      | query       |
      | London      |
      | Los Angeles |
      | New York    |