Feature: To test the get endpoint of the application
  To test different get endpoint with different data format supported by the application

  Background: Setup the base path
    Given url 'https://videogamedb.uk'
    And print '==== This is Background ===='


  @test-response
  Scenario: To get data in JSON and validate from file
    Given path '/api/v2/videogame'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
    # Create a variable to store the data from external file
    * def actualResponse = read("source/response/jsonResponse.json")
    And print 'File ==> ', actualResponse
    And match response == actualResponse
