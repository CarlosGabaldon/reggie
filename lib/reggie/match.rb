class Match
  attr :pattern
  attr :string_to_match

  def initialize(pattern:, string_to_match:)
    @pattern = pattern
    @string_to_match = string_to_match
  end

  def capture
    [@string_to_match]
  end
end
