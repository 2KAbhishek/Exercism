# frozen_string_literal: true

class SimpleCalculator
  class UnsupportedOperation < StandardError; end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)

    begin
      res = first_operand.send(operation, second_operand)
      "#{first_operand} #{operation} #{second_operand} = #{res}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end
end
