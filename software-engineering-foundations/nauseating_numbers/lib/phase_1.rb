def strange_sums(nums)
  count = 0

  while nums.length > 1
    nums[1..-1].each { |num| count += 1 if num + nums[0] == 0 }
    nums.shift()
  end

  count
end

def pair_product(nums, product)
  pair_exists = false

  while nums.length > 1
    nums[1..-1].each { |num| pair_exists = true if num * nums[0] == product }
    nums.shift()
  end

  pair_exists
end