# frozen_string_literal: true

module Port
  self::Identifier = :PALE

  def self.get_identifier(city)
    city.slice(0, 4).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    return :A if ship_identifier.to_s.start_with?('OIL', 'GAS')

    :B
  end
end
