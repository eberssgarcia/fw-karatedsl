Feature: To test the updating of name for the pet in test application
  Test the endpoint POST /v2/pet

  Scenario: Create a new pet and then update this pet
    Given url _url
    And path _path
    And print 'Helper ==> ', _url
    And print 'Helper ==> ', _path
    And print 'Helper ==>', _id
    And request { "id": '#(_id)', "category": { "id": 1, "name": "Pug" }, "name": "Perry", "photoUrls": [ "http://imagen.com/img-perry.png" ], "tags": [ { "id": 1, "name": "Bonitos" } ], "status": "available" }
    And headers { Accept : 'application/json', Content-Type: 'application/json' }
    When method post
    And status 200
    * def responseId = response.id
    * def responseName = response.name
    And print responseId
    And print response
