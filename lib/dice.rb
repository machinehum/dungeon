class Dice
# def d(sides=6)
  require 'integer'

  # Utilities
  def self.clip(floor, ceil)
    raw = yield
    [ [raw, floor].max, ceil ].min
  end

  def self.percentile5(target)
    1.d(20) <= target ? true : false
  end

  def self.percentile5clamped(target)
    self.clip(2,19) { target }
    1.d(20) <= target ? true : false
  end

  # Named rolls
  def self.roll1d6
    1.d(6)
  end

  def self.roll2d6
    2.d(6)
  end

  def self.roll2d2
    2.d(2)
  end

  def self.roll1d8
    1.d(8)
  end

  def self.roll1d10
    1.d(10)
  end

  def self.roll_stats
    d = 6 + self.roll1d6
    if d > 10 && 50.odds_check
      d += self.roll1d8
      if d == 20 && 50.odds_check
        d += self.roll1d8
      end
    end
    return d
  end

end