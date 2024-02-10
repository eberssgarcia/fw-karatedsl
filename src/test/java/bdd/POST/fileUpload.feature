Feature: To upload the file using the Karate Framework

  Background: Setup the base path
    Given url 'https://xxx.com'
    And print '=== This is Background Keyword ==='

  Scenario: TO upload the test application
    Given path '/normal/webapi/upload'
    # location of file, # name of the file, content-type header value
    * def fileLocation = 'source/data/fileUpload.txt'
    And multipart file file = { read('#(fileLocation)'), filename:'fileUpload.txt', Content-type:'multipart/form-data' }
    When method post
    Then status 200
    And print response
    # Se adjunta un archivo de tipo .txt y se envía
