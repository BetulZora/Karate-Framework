Feature: Testing different end points of spartan API
  Background:
    * def spartanUrl = 'http://35.175.65.251:8000'

  Scenario: Get one spartan and verify using path parameters
      * def expectedSpartan =
      """
    {
    "id": 101,
    "name": "Mario",
    "gender": "Male",
    "phone": 8967452312345
    }
      """
      Given url spartanUrl
      And path "/api/spartans"
      And path "101"
      And header Accept = 'application/json'
      When method get
      Then match response == expectedSpartan


  Scenario: use Query parameters in Karate
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = "j"
    And param gender = 'female'
    When method get
    Then status 200
    And match each response.content[*].gender == 'Female'

  @wip
  Scenario: POST a spartan by using spartan generator JAVA class file
    # assign generator method to a variable
    * def SpartanDG = Java.type("examples.utilities.SpartanDataGenerator")
    * def newSpartan = SpartanDG.createSpartan()
    # createSpartan actually returns a MAP, but object is turned into a JSON object by Karate
    * print newSpartan.name
    # this part will POST the new Spartan and do assertions
    Given url spartanUrl
    And path "api/spartans"
    And header Accept = 'application/json'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method POST
    Then status 201
    And match response.success == 'A Spartan is Born!'
    And match response.data.name == newSpartan.name
    # this will isolate the id of the Spartan we want to get and delete
    Then def idForDelete = response.data.id
    # this is to do a GET request to have some fun
    Given url spartanUrl
    And path "api/spartans"
    And path idForDelete
    When method get
    Then status 200
    And match response.name == newSpartan.name
    # this will send a delete request to clean up
    Given url spartanUrl
    And path "api/spartans"
    And path idForDelete
    When method DELETE
    Then status 204
