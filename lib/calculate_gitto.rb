class CalculateGitto
  def initialize(crimes_num)
    @num = crimes_num.to_i
    @min = 2573
    @max = 15193
  end

  def calculate
    gitto = (@num - @min).to_f / (@max - @min) * 100
    # gitto = @num.to_f / @max * 100
    gitto.to_i
  end

end
