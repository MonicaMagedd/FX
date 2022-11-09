class Transaction < ApplicationRecord
    validates :input_amount, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :input_currency, inclusion: { in: %w(EUR USD)}
    validates :output_amount, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    validates :output_currency, inclusion: { in: %w(EUR USD)}

end