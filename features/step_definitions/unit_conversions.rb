
And /^an incoming unit (.*)$/ do |x|
  @units_in = x
end

And /^an outgoing unit (.*)$/ do |x|
  @units_out = x
end

And /^a number (.*)$/ do |x|
  @number = x.to_f
end

Then /^I should get a result of (.*)$/ do |x|
  result = UnitConversion.convert_units(@units_in, @units_out, @number)
  result == x
end