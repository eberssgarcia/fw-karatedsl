@test-request
Feature: To test the get endpoint of the application
  To test different get endpoint with different data format supported by the application

  Background: Setup the base path
    Given url 'https://videogamedb.uk'
    And print '==== This is Background ===='

  @test-request @CP001
  Scenario: To get all the data from application in JSON format
    Given path '/api/v2/videogame'
    And header Accept = 'application/json'
    When method get # Send the get request
    Then status 200 # The status code response should be 200
    And match header Content-Type == 'application/json'

  @test-request @CP002
  Scenario: To get all the data from application in XML format
    Given path '/api/v2/videogame'
    And header Accept = 'application/xml'
    When method get # Send the get request
    Then status 200 # The status code response should be 200