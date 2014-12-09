Feature: A
  As Foo
  I want Bar

  @passing
  Scenario: POC
    Given kittens
    And foo "foo"

  @broken
  Scenario: POC 2
    Given bar
