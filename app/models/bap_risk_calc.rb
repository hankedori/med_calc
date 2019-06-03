class BAPRiskCalc
  include ActiveModel::Model

  attr_accessor :age, :bun, :gcs, :pulse

  validates! :age, numericality: { greater_than_or_equal_to: 41 }, presence: true
  validates! :bun, :gcs, :pulse, presence: true


  # calculate the risk class
  def score
    bap = calculate_bap
    if bap == 0 then
      @score = (@age < 65 ? 1 : 2)
    else
      @score = bap + 2
    end

    # return the score
    @score
  end

  private

  # calculate the BAP score
  def calculate_bap
    @calculate_bap ||= (@bun >= 25 ? 1 : 0) +
                       (@gcs <  14 ? 1 : 0) +
                       (@pulse >= 109 ? 1 : 0)
  end
end
