class DecafRiskCalc
  include ActiveModel::Model

  attr_accessor :age, :emrcd, :eosinophils,
                :chest_x_ray_consolidation, :pH, :atrial_fibrillation

  validates! :age, numericality: {greater_than_or_equal_to: 35}, presence: true

  validates! :emrcd,
              numericality: { less_than_or_equal_to: 2,
                              greater_than_or_equal_to: 0 },
              presence: true

  validates! :atrial_fibrillation,
              inclusion: { in: [0,1], message: "not an allowable number"},
              presence: true

  def decaf_score
    # .. implement something here
  #  puts @pH.to_s
    @decaf_score ||= @emrcd +
        (@eosinophils < 0.05e+09 ? 1 : 0) +
        @chest_x_ray_consolidation +
        (@pH < 7.30 ? 1 : 0) +
        (@atrial_fibrillation)

  end
  # ...
end
