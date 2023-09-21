Feature: To test the get end point with Query Parameters
  GET / https://reqres.in/api/users

  Background: Create and initialize base url
    Given url 'https://reqres.in'

  Scenario: To get the data using Query Parameters
    Given path '/api/users'
    And param page = 1
    And param per_page = 3
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And print response

#    Ejemplo: Crear una mascota y llamar usando Query Params.
  Scenario: To get data using Query Parameter
#  Create the Pet entry
#  Get the newly created Pet entry using query param
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def createdJobId = getRandomValue()
    * def createJob = call read('../POST/createPetEntryWithVariables.feature') { _url:'https://petstore.swagger.io', _path:'/v2/pet', _id:'#(createdJobId)' }
#  Send the get request with Query Parameters

    Given path '/api/pet'
#    And param id = createdJobId
#    And param name = 'Perry'
    And params {id: '#(createdJobId)', name: 'Perry' }
    And headers {Accept: 'application/json'}
    When method get
    Then status 200
    And match response.petId == createdJobId