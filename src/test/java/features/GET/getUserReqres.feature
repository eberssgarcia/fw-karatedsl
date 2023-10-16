Feature: Get user on Reqres

  Scenario: Get a user with id less than 10
    * def getRandomValue = function() { var id; do { id = Math.floor((100) * Math.random()); } while (id >= 10); return id; }
    * def id = getRandomValue()
    And print id
    Given url "https://reqres.in" + "/api/users/" + id
    When method get
    Then status 200
    And print response

  # Analiza el cuerpo de la respuesta JSON
    * def responseId = response.data.id
    And print responseId


#    And match response.data.email == "janet.weaver@reqres.in"
#    And match response.data.first_name == "Janet"
#    And match response.support.url == "https://reqres.in/#support-heading"

