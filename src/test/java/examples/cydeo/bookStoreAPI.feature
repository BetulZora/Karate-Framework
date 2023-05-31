Feature: Simple API body header status checks
  Background: get all books
    Given url "https://demoqa.com/BookStore/v1/Books"
    When method get


  Scenario: GET all books and verify status and headers
    # the URL and get method moved to background
    Then status 200
    And match header Content-Type == 'application/json; charset=utf-8'
    And match header Content-Length == '#present'

  @wip
  Scenario: Verify Body information
    And def numberOfBooks = response.books.length
    Then match numberOfBooks == 8
    And match response.books[0].title == 'Git Pocket Guide'
    # lets do a loop inside books array
    And match each response.books[*].pages == '#number'
