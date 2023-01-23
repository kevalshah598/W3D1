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

    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true
