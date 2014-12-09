Feature: A
  As Foo
  I want Bar

  @passing
  Scenario: POC
    Given replacement is moose
    And the argument is set to "foo"

  @broken
  Scenario: POC 2
    Given this step changes replacement and calls the other step
