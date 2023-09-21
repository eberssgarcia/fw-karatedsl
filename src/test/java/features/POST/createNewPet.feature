Feature: To create nue Pet entry in the application
  Use POST /v2/pet to create Pet entry in the application

  Background: Create and initialize base URI
    Given url 'https://petstore.swagger.io'

  Scenario: To create the new Pet entry in JSON format
    Given path '/v2/pet'
    And request {  "category": {  "_comment": "Categoría de mascota.",  "name": "Doberman"  },  "_comment": "Nombre de la mascota.",  "name": "Vegueta",  "tags": [  {  "_comment": "Tag de mascota.",  "name": "mascotas"  }  ],  "status": "available"  }
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    And match response.name == 'Vegueta'


  Scenario: To create the new Pet entry in JSON format using file
    Given path '/v2/pet'
#    And print read('classpath:source/request/jsonRequest.json')
#    * def body = read('classpath:source/request/jsonRequest.json')
    * def body = read('source/request/jsonRequest.json')
    And request body
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    And match response.name == 'Vegueta'


  Scenario: To create the new Pet entry in JSON format embedded expresion
    Given path '/v2/pet'
    * def getId = function() { return Math.floor((100) * Math.random()); }
    And request {  "id": '#(getId())',  "category": {  "id": 0,  "name": "string"  },  "name": "doggie",  "photoUrls": [  "string"  ],  "tags": [  {  "id": 0,  "name": "string"  }  ],  "status": "available"  }
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    And match response.name == 'doggie'

  Scenario: To create the new Pet entry in JSON format embedded expresion
    Given path '/v2/pet'
    * def getId = function() { return Math.floor((100) * Math.random()); }
    * def id = getId()
    And request {  "id": '#(id)',  "category": {  "id": 0,  "name": "string"  },  "name": "doggie",  "photoUrls": [  "string"  ],  "tags": [  {  "id": 0,  "name": "string"  }  ],  "status": "available"  }
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    And print response
    And match response.name == 'doggie'
    And match response.id == '#(id)'
    And print response.id