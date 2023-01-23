class Array
    def my_each(&bloc)
        i = 0
        while i < self.length
            bloc.call(self[i])
        i += 1
        end
        return self
    end

    def my_select(&bloc)
        new_ary = []
        self.my_each do |ele|
            if bloc.call(ele)
                new_ary << ele
            end
        end
        new_ary
    end

    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []

end

# calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#        2
#        3
#        1
#        2
#        3
   
#    p return_value  # => [1, 2, 3]