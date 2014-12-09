Given(/^the argument is set to "(.*)"$/) do | arg1 |
  # Using STDOUT.puts to avoid reformatting & buffering of output
  STDOUT.puts "arg1 was set to: " + arg1
  STDOUT.puts "replacement was set to: " + @replacement
  arg1 = arg1.sub "foo", @replacement 
end

Given(/^this step changes replacement and calls the other step$/) do
  @replacement = 'bar'
  # This should call the step: Given the argument is set to "foo"
  step("the argument is set to \"foo\"")
  # But it doesn't, it calls: Given thr argument is set to "moose"
end

Given(/^replacement is moose$/) do
  @replacement = 'moose'
end
