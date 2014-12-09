Proves some odd (unexpected?) behaviour in cucummber's step reuse.

It boils down to:

* I have a step which takes a parameter
* I call that step in Scenario 1 with parameter "X"
 * During that step. I rewrite the value of the argument it receives to something else. Say "Y"
* In Scenario 2, I have a step which calls the origional step, with the value "Z"
 * That step receives the ***rewritten*** argument from ***after*** the step was called the first time. IE "Y", not "Z"

What happens:

    pcluff@waluigi.local ➜  cuke-bug git:(master) ✗ bundle exec cucumber
    Feature: A
      As Foo
      I want Bar
    
      @passing
      Scenario: POC                      # features/bug.feature:6
        Given replacement is moose       # features/step_definitions/bug_steps.rb:15
    arg1 was set to: foo
    replacement was set to: moose
        And the argument is set to "moose # features/step_definitions/bug_steps.rb:1
    
      @broken
      Scenario: POC 2                                                # features/bug.feature:11
    arg1 was set to: moose
    replacement was set to: bar
        Given this step changes replacement and calls the other step # features/step_definitions/bug_steps.rb:8
    
    2 scenarios (2 passed)
    3 steps (3 passed)
    0m0.008s

What should happen: 

    pcluff@waluigi.local ➜  cuke-bug git:(master) ✗ bundle exec cucumber
    Feature: A
      As Foo
      I want Bar
    
      @passing
      Scenario: POC                      # features/bug.feature:6
        Given replacement is moose       # features/step_definitions/bug_steps.rb:15
    arg1 was set to: foo
    replacement was set to: moose
        And the argument is set to "moose # features/step_definitions/bug_steps.rb:1
    
      @broken
      Scenario: POC 2                                                # features/bug.feature:11
    arg1 was set to: foo
    replacement was set to: bar
        Given this step changes replacement and calls the other step # features/step_definitions/bug_steps.rb:8
    
    2 scenarios (2 passed)
    3 steps (3 passed)
    0m0.008s
