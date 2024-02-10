Feature: Default

  @TEST-0001 @test.feature
  Scenario: Get all users
    Given url 'https://reqres.in/api/users'
    When method GET
    Then status 200
    And match response.data[*].id == '#[] #number'