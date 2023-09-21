Feature: To test the updating of name for the pet in test application
  Test the endpoint POST /v2/pet

  Scenario: To update pet for existing pet in JSON format
    Given url 'https://petstore.swagger.io'
    And path '/v2/pet'
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def id = getRandomValue()
    And request { "id": '#(id)', "category": { "id": 1, "name": "Pug" }, "name": "Perry", "photoUrls": [ "http://imagen.com/img-perry.png" ], "tags": [ { "id": 1, "name": "Bonitos" } ], "status": "available" }
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    * def responseId = response.id
    And print responseId
