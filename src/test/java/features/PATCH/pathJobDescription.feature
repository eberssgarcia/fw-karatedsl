Feature: To test the path and point for updating the job description
  PATH /normal/webapi/update/details

  Background: Create and initialize base url
    Given url 'http://localhost:9898'

  Scenario: To update the job description for newly added job entry
#  Create a new job entry
#  using the path request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def createJobId = getRandomValue()
    * def createJob = call read('../POST/createPetEntryWithVariables.feature') { _url:'https://petstore.swagger.io', _path:'/v2/pet', _id:'#(id)' }
#  Patch request
    * def jobDes = 'To develop android'
    Given path '/normal/webapi/update/details'
    And params { id: '#(createJobId)', jobTitle: 'Software Engineer', jobDescription: '#(jobDes)'  }
    And header Accept = 'application/json'
    When request patch
    Then status 202
    And match response.jobDescription == jobDes


  Scenario: To update the job description for newly added job entry with non-existing job id
#  Create a new job entry
#  using the path request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def createJobId = getRandomValue()
    * def createJob = call read('../POST/createPetEntryWithVariables.feature') { _url:'https://petstore.swagger.io', _path:'/v2/pet', _id:'#(id)' }
#  Patch request
    * def jobDes = 'To develop android'
    Given path '/normal/webapi/update/details'
    And params { id: '-1', jobTitle: 'Software Engineer', jobDescription: '#(jobDes)'  }
    And header Accept = 'application/json'
    And request {}
    When request patch
    Then status 404


  Scenario: To update the job description for newly added job entry without job title
#  Create a new job entry
#  using the path request update the job description of newly added job entry
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    * def createJobId = getRandomValue()
    * def createJob = call read('../POST/createPetEntryWithVariables.feature') { _url:'https://petstore.swagger.io', _path:'/v2/pet', _id:'#(id)' }
#  Patch request
    * def jobDes = 'To develop android'
    Given path '/normal/webapi/update/details'
    And params { id: '#(createJobId)', jobDescription: '#(jobDes)'  }
    And header Accept = 'application/json'
    When request patch
    Then status 400
    And match response.message == "Required String parameter 'jobTitle' is not present"