class BAPRiskCalc
  include ActiveModel::Model

  attr_accessor :age # ...

  validates! :age, numericality: { greater_than_or_equal_to: 41 }, presence: true
  # validates! ...

  def score
    @score ||= calculate_something + 2
  end

  private

  def calculate_something
    @calculate_something ||= 1
  end
end
