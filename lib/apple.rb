def apple_picker_with_select(fruit_list)
  # fruit_list will look something like: ["apple", "banana", "apple"]
  # you want to return an array that just has apples in it
  fruit_list.select { |fruit| fruit == "apple" }
  # select maps all elements, iterates over them, and then returns a modified array, which is exactly what we want.
  # here, it only returns fruits that are equal to apple
  # doesn't modify the actual array
  # selection |item| condition == what needs to be done; if nothing is done, then returns the array of items satisfying condition
end

def apple_picker_with_collect(fruit_list)
  # fruit_list will look something like: ["apple", "banana", "apple"]
  # you want to return an array that just the apples, just like the 
  # challenge above
  fruit_list.collect {|fruit| fruit == "apple"? fruit : nil }.compact
  # cannot use return apple because it stops it and does not keep forming the array
  # can use .compact on the end word when it is an outcome of the block
  # fruit_list.collect {|fruit| fruit == "apple"} will return an array that looks like [true true false false true]
  # so we need to check is the value is true, and replace the true values with "apple" and replace false values with nil
  # which we then can remove with compacting it
  # .compact is actually great for this because it returns a copy of this array without nils

end

# alternatively, we could count number of apples and then return an instance of array where we enter apples as many times as we have counted

