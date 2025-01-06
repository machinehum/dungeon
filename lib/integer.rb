class Integer

  def d(sides=6)
    prng = Random.new
    a = 0
    self.times do |n|
      a += prng.rand(1..sides)    
    end   
    return a
  end

  def odds_check
    prng = Random.new
    if prng.rand(1..100)  <= self
      return true
    else
      return false
    end
  end
end
