Feature: Validate the JSON squema
  To validate the JSON squema for POST /v2/pet

  Background: Create and initialize base URI
    Given url 'https://petstore.swagger.io'

  Scenario: To create the new Pet entry in JSON format using file
    Given path '/v2/pet'
    * def body = read('source/request/jsonRequest.json')
    And request body
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    And match response ==
    """
    {
    "id": '#number',
    "category": '#object',
    "name": '#string',
    "photoUrls": '#[]',
    "tags": '#[] #object',
    "status": '#string'
    }
    """