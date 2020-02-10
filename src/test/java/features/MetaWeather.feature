@meta_weather
Feature: Meta weather tests
  
  Background: setup base URI
    * url 'https://www.metaweather.com'

    Scenario: Search for London
      Given path '/api/location/search'
      And param query = 'London'
      When method get
      Then status 200
      And match response contains {title:'London'}