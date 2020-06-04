def my_uniq(ar)
    uniq_hash = Hash.new(0)
    ar.each do |ele|
        uniq_hash[ele] += 1
    end
    uniq_hash.keys
end

def two_sum(ar)
    sum_arr = []
    (0...ar.length).each do |i|
        (0...ar.length).each do |j|
            sum_arr << [i,j] if ar[i] + ar[j] == 0 && j > i
        end
    end
    sum_arr
end

def my_transpose(arr1)
    (0...arr1.length).map do |idx|
        arr1.map {|ele| ele[idx]}
    end
end

def stock_picker(arr)
    days = [0,0]
    max_val = 0
    # [5,7,2,9,3]
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if arr[j] - arr[i] > max_val
                max_val = arr[j] - arr[i] 
                days = [i,j]
            end
        end
    end
    days
end
