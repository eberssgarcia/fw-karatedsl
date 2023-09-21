Feature: To test the get endpoint of the application
  To test different get endpoint with different data format supported by the application

  Background: Setup the base path
    Given url 'https://videogamedb.uk'
    And print '==== This is Background ===='

  @test-response
  Scenario: To get data in JSON
    Given path '/api/v2/videogame'
    And header Accept = 'application/json'
    When method get
    And status 200
    And print response
    And match response.[0].id == 1
    And match response.[0].name == 'Resident Evil 4'
    And match response.[1].id == 2
    And match response.[1].name == 'Gran Turismo 3'
#  Acceder y validar de un arreglo anidado - ejemplo extra
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'

