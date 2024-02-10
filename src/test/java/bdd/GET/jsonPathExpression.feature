Feature: Validate the JSON squema
  To validate the JSON squema for POST /v2/pet

  Background: Create and initialize base URI
    Given url 'https://videogamedb.uk'

  Scenario: To get the value of property using json path expression
    Given path '/api/v2/videogame'
    When method get
    Then status 200
    And print response
    # Karate.jsonPath(doc, jsonPathExpression)
    * def id = 1
    * def name = karate.jsonPath(response, '$[?(@.id == ' + id + ')].name')
    * def category = karate.jsonPath(response, '$[?(@.id == 1)].category')
    And print 'Name of video =>', name
    And print 'Name of category =>', category