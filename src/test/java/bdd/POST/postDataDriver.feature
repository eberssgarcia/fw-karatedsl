Feature: To create User in the test application

#  Background: Read the data for driven CSV
#    * def testData = read('source/data/testData.csv')

  Scenario Outline: To create User in the application <method>
    Given print '<url>'
    Then print '<path>'
    When print '<method>'
    And print '<status>'
    Examples:
      | url               | path              | method | status |
      | https://reqres.in | /api/users        | get    | 200    |
      | https://reqres.in | /api/users?page=2 | post   | 200    |

  Scenario Outline: Data Driven for register user in Reqres - <name>
    Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And request { "name": '#(name)', "job": '#(job)' }
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And print response
    And status <status>
    Examples:
      | name         | job                  | status |
      | Ever Garcia  | Quality Engineer     | 201    |
      | Carlos Bravo | Software Development | 201    |
      | 12345        | 12345                | 404    |


  Scenario Outline: Data Driven for register user in Reqres using CSV files - <name>
    Given url 'https://reqres.in'
    And path '/api/users?page=2'
    And request { "name": '#(name)', "job": '#(job)' }
    And headers { Accept: 'application/json', Content-Type: 'application/json' }
    When method post
    And print response
    And status <status>
    Examples:
#      | testData |
      | read('source/data/testData.csv') |