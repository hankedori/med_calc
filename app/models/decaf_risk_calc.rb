class DecafRiskCalc
  include ActiveModel::Model

  attr_accessor :emrcd # ...

  validates! :emrcd, numericality: { less_than_or_equal_to: 2, greater_than_or_equal_to: 0 }, presence: true
  # validates! ...

  def initialize(args)
    super
    # ...
  end

  def decaf_score
    # .. implement something here
    @decaf_score ||= score - 1
  end

  private

  def score
    @score ||= 4
  end

  # ...
end
