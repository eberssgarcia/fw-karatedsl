Feature: To test the delete endpoint
  DELETE /api/users/{id}

  Background: Create and initialize base url
    Given url 'https://petstore.swagger.io'

  Scenario: To delete the user entry from application using user id
#  <Gherkin Keyboard> <call> <read(<location of file>)
#  Given call read('../POST/createPetEntryWithVariables.feature') {var1:value, var2:value}
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def id = getRandomValue()
    * def postRequest = call read('../POST/createPetEntryWithVariables.feature') { _url:'https://petstore.swagger.io', _path:'/v2/pet', _id:'#(id)' }
#  Delete request
    Given path '/v2/pet/' + id
    And print id
    And headers { Accept: 'application/json' }
    When method delete
    And status 200
    And print response
#  Get request
    Given path '/v2/pet/' + '#(id)'
    And header Accept = 'application/json'
    When method get
    Then status 404