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

    def my_reject(&bloc)
        new_array = []
        self.my_each do |ele|
            if !bloc.call(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_any?(&bloc)
        self.my_each do |ele|
            if bloc.call(ele) 
                return true
            end
        end
        return false
    end

    def my_all?(&bloc)
        self.my_each do |ele|
            return false if !bloc.call(ele)
        end
        return true
    end

    def my_flatten
        final_array = []
        self.my_each do |ele|
            if ele.is_a? Array 
                final_array.concat(ele.my_flatten)
            else
                final_array << ele
            end
        end
        final_array
    end

end

# return array.first if array.length == 1
p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
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

    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# # p a.my_any? { |num| num > 1 } # => true
# # p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true
