Feature: To test the updating of name for the pet in test application
  Test the endpoint PUT /v2/pet

  Background: Create and initialize base url
    Given url 'https://petstore.swagger.io'

  Scenario: To update pet for existing pet in JSON format
    # Create a new pet
    # Update the pet using PUT request
    # Using jsonPath verify the updating of details in Pet
    Given path '/v2/pet'
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def id = getRandomValue()
    And request { "id": '#(id)', "category": { "id": 1, "name": "Pug" }, "name": "Perry", "photoUrls": [ "http://imagen.com/img-perry.png" ], "tags": [ { "id": 1, "name": "Bonitos" } ], "status": "available" }
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    # PUT request
    Given path '/v2/pet'
    And request
    """
    {
  "id": '#(id)',
  "category": {
    "id": 1,
    "name": "Doberman"
  },
  "name": "Zeus",
  "photoUrls": [
    "http://imagen.com/img-zeus.png"
  ],
  "tags": [
    {
      "id": 1,
      "name": "Bravos"
    }
  ],
  "status": "available"
}
    """
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method put
    And status 200
    And print response
    * def tagsArray = karate.jsonPath(response, '$[?(@.id == ' + id + ')].tags')
    And print tagsArray
    And match tagsArray == '#[1]'
    And match tagsArray[0] == '#[1]'


  Scenario: To update pet for existing pet in JSON format by calling another feature file
#  <Gherkin Keyboard> <call> <read(<location of file>)
#    Given call read('../createPetEntry.feature')
    Given call read("../POST/createPetEntry.feature")
#  PUT request
    And path '/v2/pet'
    And request
    """
    {
  "id": 125,
  "category": {
    "id": 1,
    "name": "Doberman"
  },
  "name": "Zeus",
  "photoUrls": [
    "http://imagen.com/img-zeus.png"
  ],
  "tags": [
    {
      "id": 1,
      "name": "Bravos"
    }
  ],
  "status": "available"
}
    """
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method put
    And status 200
    And print response
    * def tagsArray = karate.jsonPath(response, '$[?(@.id == 125)].tags')
    And print tagsArray
    And match tagsArray == '#[1]'
    And match tagsArray[0] == '#[1]'


  Scenario: To update pet for existing pet in JSON format by calling another feature file using shared context
#  <Gherkin Keyboard> <call> <read(<location of file>)
#    Given call read('classpath:features/POST/createPetEntry.feature')
    * def postRequest = call read('../POST/createPetEntry.feature')
    And print 'Calling Feature ==>', postRequest.id
    And print 'Calling Feature ==>', postRequest.getRandomValue()
#  PUT request
    Given path '/v2/pet'
    And request
  """
    {
  "id": '#(postRequest.id)',
  "category": {
    "id": 1,
    "name": "Doberman"
  },
  "name": "Zeus",
  "photoUrls": [
    "http://imagen.com/img-zeus.png"
  ],
  "tags": [
    {
      "id": 1,
      "name": "Bravos"
    }
  ],
  "status": "available"
}
    """
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method put
    And status 200
    And print response
    * def tagsArray = karate.jsonPath(response, '$[?(@.id == ' + postRequest.id + ' )].tags')
    And print tagsArray
    And match tagsArray == '#[1]'
    And match tagsArray[0] == '#[1]'


  Scenario: To update pet for existing pet in JSON format by calling another feature file with variables
#  <Gherkin Keyboard> <call> <read(<location of file>)
#    Given call read('../POST/createPetEntryWithVariables.feature') {var1:value, var2:value}
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def id = getRandomValue()
    * def postRequest = call read('../POST/createPetEntryWithVariables.feature') { _url:'https://petstore.swagger.io', _path:'/v2/pet', _id:'#(id)' }
#  PUT request
    Given path '/v2/pet'
    And request
  """
    {
  "id": '#(id)',
  "category": {
    "id": 1,
    "name": "Doberman"
  },
  "name": "Zeus",
  "photoUrls": [
    "http://imagen.com/img-zeus.png"
  ],
  "tags": [
    {
      "id": 1,
      "name": "Bravos"
    }
  ],
  "status": "available"
}
    """
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method put
    And status 200
    And print response
    * def tagsArray = karate.jsonPath(response, '$[?(@.id == ' + id + ' )].tags')
    And print tagsArray
    And match tagsArray == '#[1]'
    And match tagsArray[0] == '#[1]'