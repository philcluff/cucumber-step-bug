Given(/^foo "(.*)"$/) do | arg1 |
  # Using STDOUT.puts to avoid reformatting & buffering of output
  STDOUT.puts "arg1 was set to: " + arg1
  STDOUT.puts "replacement was set to: " + @replacement
  arg1.sub! "foo", @replacement 
end

Given(/^bar$/) do
  @replacement = 'bar'
  # This should call the step: Given foo "foo""
  step("foo \"foo\"")
  # But it doesn't, it calls: Given foo "moose"
end

Given(/^kittens$/) do
  @replacement = 'moose'
end
