def anti_prime?(num)
  (1...num).map { |number| divisor_count(number) }.max < divisor_count(num)
end

def divisor_count(num)
  (1...num).inject(0) { |acc, factor| num % factor == 0 ? acc + 1 : acc }
end

def matrix_addition(matrix1, matrix2)
  matrix1.each_with_index.map do |arr, i|
    arr.each_with_index.map do |el, j|
      el += matrix2[i][j]
    end
  end
end

def mutual_factors(*nums)
  factors = nums.map { |num| get_factors(num) }
  
  factors[0].select { |factor| factors.flatten.count(factor) == nums.length }
end

def get_factors(num)
  (1..num).select { |factor| num % factor == 0}
end