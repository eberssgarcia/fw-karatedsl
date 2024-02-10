Feature: Test a Engineer

  Background:
    Given url 'https://videogamedb.uk'

  @validate_all_squema
  Scenario: Get all video and validate squema
    Given path '/api/v2/videogame'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And print response
  # Define el esquema de datos esperado en la respuesta JSON
    * def videoSchema = { "id": "#number", "name": "#string", "releaseDate": "#string", "reviewScore": "#number", "category": "#string", "rating": "#string" }
  # Compara la respuesta con el esquema definido
    And match response contains videoSchema
    And print videoSchema

