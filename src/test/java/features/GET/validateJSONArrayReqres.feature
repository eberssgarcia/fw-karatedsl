Feature: To test the get endpoint of the application
  To test different get endpoint with different data format supported by the application

  Background: Setup the base path
    Given url 'https://reqres.in'
    And print '==== This is Background ===='


  @test-response
  Scenario: To get data in JSON Validate
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    And status 200
    And print response
    # Validate namer in Array [] in method {} => [{}, {}, {}]
    And match response.data[1].first_name == 'Lindsay'
    # Validate the size of array []
    And match response.data == '#[6]'
    # Validate url in Method {}
    And match response.per_page == 6
    And match response.data[0].avatar == 'https://reqres.in/img/faces/7-image.jpg'
    And match response.support.url == 'https://reqres.in/#support-heading'
    # Validate value of Array -> technology['Apple', 'Samsung', 'Google']
    And match response[0].project[0].technology[*] == ['Apple', 'Samsung', 'Google']
    # Contains keyboard
    And match response[0].project[0].technology[*] contains ['Apple', 'Samsung'] # Its ok because you use Contains

  @test-response
  Scenario: To get data in JSON Validate and validate using Fuzzy matcher
    Given path '/api/users?page=2'
    And header Accept = 'application/json'
    When method get
    And status 200
    And print response
    # Validate type of date of value
    And match response.data == '#array'
    And match response.data[1].last_name == '#string'
    And match response.data[1].id == '#number'
    And match response.data[1].first_name == '#present'
    And match response.data[1].avatar == '#string'
    And match response.data[1].email != '#number'



