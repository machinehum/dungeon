class CharacterClass < ApplicationRecord
  def hit_coefficient
    yield(self.hit_coefficient_divisor,self.hit_coefficient_bonus)
  end
end

# Druid
# Shadewalker
# Witch
# Hunter
# Bard
# Feybinder


# swing count
# Fighters, samurai, and lords have values of:
# (CharacterLevel/5) + 1

# Ninjas get:
# (CharacterLevel/5) + 2


# HitCalcMod
# A hidden stat mentioned previously, used to determine your hit odds.

# Base value for fighters, priests, samurai, lords, and ninjas is (CharacterLevel/3) + 2.

# Base value for mages, thieves, and bishops is (CharacterLevel/5).

# If your strength is higher than 15, you get a (Strength – 15) bonus. If it’s below 6, then you get a (6 – Strength) penalty.

# This value is further increased by equipping weapons, each of which has an invisible value.

# Each strike’s chance of hitting is:
# (HitCalcMod + MonsterAC + (3*Victim) - 1) * 5%
