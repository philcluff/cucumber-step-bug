Proves some odd (unexpected?) behaviour in cucummber's step reuse.

It boils down to:

* I have a step which takes a parameter
* I call that step in Scenario 1 with parameter "X"
 * During that step. I rewrite the value of the argument it receives to something else. Say "Y"
* In Scenario 2, I have a step which calls the step which accepts the parameter
 * That step receives the _*rewritten*_ argument from _*after*_ the step was called the first time. IE: "Y"
