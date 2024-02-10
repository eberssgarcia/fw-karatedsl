Feature: To execute the JavaScript Function

  Scenario: Execute Java Script Function with and without parameter
    * def getIntValue = function() { return 10 }
    Then print 'Function value => ', getIntValue()
    * def getRandomValue = function() { return Math.floor((100) * Math.random()); }
    Then print 'Function value => ', getRandomValue()
    * def getStringValue = function(arg1) {return 'Hola ' + arg1;}
    Then print 'Function value => ', getStringValue('Mundo')