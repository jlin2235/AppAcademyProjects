def first_anagrams?(str1,str2)
    possible_anagrams = str1.chars.permutation.to_a
    possible_anagrams.include?(str2.chars)
end





p first_anagrams?("elvis", "lives")    #=> true
p first_anagrams?("gizmo", "sally")    #=> false
