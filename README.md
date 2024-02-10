# Framework de automatización con Karate DSL

Este framework de automatización para microservicios/APIs esta desarrollado con Karate DSL y Java 1.8.

<table>
  <tr> 
    <th>
      <h3>
          <a href="https://github.com/eberssgarcia/fw-karatedsl">⏩ <br/> FW Karate DSL</a>
      </h3>
   </th>
   <td>
     Puedes iniciar desde VS Code, IntelliJ IDEA.
   </td>
  </tr>
</table>

# Herramientas y/o tecnologías a usar

* **Intellij IDEA:** Este IDE permitirá crear proyectos.
* **JDK Java verisón 1.8:** Configurar como variable de entorno.
* **Depedencias Karate DSL:** Estas dependencias se debe ingresar en el POM.XML
* **apache-maven-3.8.6:** Descargar package y configurar como variable de entorno.

# Configurar proyecto

1. Crear proyecto de tipo MAVEN
2. Ingresar las dependencias de Karate DSL en el archivo POM.xml
3. Ejecutar comando `mvn install` a través de la terminal

**Nota**: Si ya tienes definido test de prueba, puedes ejecutar el comando `mvn install -DskipTests` para omitir dichos
tests.

# Dependencias

1. **Dependencia de Karate DSL**

**`Repositorio`**: XXX

        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-core</artifactId>
            <version>1.2.0</version> <!-- Asegúrate de utilizar la versión más reciente de Karate DSL -->
            <scope>test</scope>
        </dependency>

2. **Dependencia para integración con JUnit 5 (opcional, si prefieres utilizar JUnit)**

**`Repositorio`**: XXX

        <dependency>
            <groupId>com.intuit.karate</groupId>
            <artifactId>karate-junit5</artifactId>
            <version>1.2.0</version> <!-- Asegúrate de utilizar la versión más reciente de Karate DSL -->
            <scope>test</scope>
        </dependency>

3. **Dependencia para generar informes de Cucumber (opcional, si deseas generar informes)**

**`Repositorio`**: XXX

        <dependency>
            <groupId>net.masterthought</groupId>
            <artifactId>cucumber-reporting</artifactId>
            <version>5.4.0</version> <!-- Asegúrate de utilizar la versión más reciente de Cucumber Reporting -->
            <scope>test</scope>
        </dependency>

##### Ejecución de los features de manera independiente, utilizar lo siguiente:

| web feature                              | TAG             |
|------------------------------------------|-----------------|
| Ejecución de todos los casos de pruebas. | @test-execution |
| Ejecutar casos de pruebas agrupados      | @test-group     |
| Ejecutar casos de pruenas independientes | @test-set       | 

#### Ejemplo

```cucumber
@test-execution
Feature: To test the get endpoint of the application
  To test different get endpoint with different data format supported by the application

  Background: Setup the base path
    Given url 'https://videogamedb.uk'
    And print '==== This is Background ===='

  @test-group @test-001
  Scenario: To get all the data from application in JSON format
    Given path '/api/v2/videogame'
    And header Accept = 'application/json'
    When method get # Send the get request
    Then status 200 # The status code response should be 200
    And match header Content-Type == 'application/json'

  @test-group @test-002
  Scenario: To get all the data from application in XML format
    Given path '/api/v2/videogame'
    And header Accept = 'application/xml'
    When method get # Send the get request
    Then status 200 # The status code response should be 200
```

<div>
  <a href="https://www.linkedin.com/in/eberssgarcia/">
    <img src="https://img.shields.io/badge/@eberssgarcia--lightgrey?logo=linkedin&amp;style=social">
  </a>
</div>