class Camera
  BRAND_VALUE = {
    sony: 2,
    canon: 1,
    lg: 0
  }
  COLOR_VALUE = {
    black: 2,
    silver: 1,
    navy: 0
  }
  attr_reader :brand, :color
  def initialize(brand, color)
    @brand = brand.downcase.to_sym
    @color = color.downcase.to_sym
  end

  def <=>(other)
    compare = BRAND_VALUE[self.brand] <=> BRAND_VALUE[other.brand]
    compare = COLOR_VALUE[self.color] <=> COLOR_VALUE[other.color] if compare == 0
    compare
  end

  def <(other)
    (self <=> other) == -1
  end

  def >(other)
    (self <=> other) == 1
  end
end
