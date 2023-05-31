Feature: Simple Karate Scripts
  Notice that no step defs are needed


  Scenario: How to print
    Given print "Hello World"
    Given print "2+2=5"
    #arithmetic operations work the same as in Java
    * print 2+2
    * def name = 'Mike'
    * def age = 30
    * print name,"is",age,"years old"
    # the comma concatenates and inserts a space


  Scenario: JSON object, first class citizens of Karate Framework
    * def student = {'name' : 'Oscar', 'owe_tuition': false}
    * print student.name
    # use gpath syntax with key to get any value in JSON object
    #  can use triple quotes as well for objects in more than one line
    * def oneSpartan =
    """
    {
        "id": 1,
        "name": "Meade",
        "gender": "Male",
        "phone": 3584128232
    }
    """
    * print oneSpartan.gender
    # json objects can be read from a different file
    * def fourSpartans = read("classpath:examples/data/spartans.json")
    * print fourSpartans
    # reach inside the json arrays
    * print fourSpartans[2].name
