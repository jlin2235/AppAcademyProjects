def my_min(list) # array
    list.each do |num1|
        if list.all?{|el| num1 <= el }
        return num1 
        end
    end
end


def my_min(list)
    list.inject do |acc,el|
        if acc <= el
            acc
        else
            el
        end
    end
end



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list) 


def largest_contiguous_subsum(list) #array 
    sub_array = []
    idx = list.length
    (0...idx).each do |start_idx|
        (start_idx...idx).each do |end_idx|
            sub_array << list[start_idx..end_idx]
        end
    end
    sub_array.map{|ele| ele.sum}.max
end







list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])