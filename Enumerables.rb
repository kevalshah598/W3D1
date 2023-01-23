class Array
    def my_each(&bloc)
        i = 0
        while i < self.length
            bloc.call(self[i])
        i += 1
        end
        return self
    end
end

# calls my_each twice on the array, printing all the numbers twice.
return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end
   # => 1
       2
       3
       1
       2
       3
   
   p return_value  # => [1, 2, 3]