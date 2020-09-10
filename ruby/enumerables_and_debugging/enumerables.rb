class Array 
  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx += 1
    end

    self
  end

  def my_select(&prc)
    output = []

    self.my_each do |el|
      output << el if prc.call(el)
    end

    output
  end

  def my_reject(&prc)
    output = []

    self.my_each do |el|
      output << el if !prc.call(el)
    end

    output
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el)}
    false
  end

  def my_all?(&prc)
    self.my_each { |el| return false if !prc.call(el)}
    true
  end
end
