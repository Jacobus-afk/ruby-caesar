# frozen_string_literal: true

def _handle_values_over_26(cypher_jump)
  cypher_jump.abs % 26
end

def _handle_negative_jump(cypher_jump)
  cypher_jump.negative? ? -1 : 1
end

def _match_char_and_cypher_cases(character, cypher_char)
  return 26 if (character =~ /[A-Z]/ && (cypher_char !~ /[A-Z]/)) || (character =~ /[a-z]/ && (cypher_char !~ /[a-z]/))

  0
end

def _shift_characters(initial_text, cypher_jump, negative_jump)
  initial_text.chars.map do |character|
    if character =~ /[A-Za-z]/
      cypher_ascii_code = character.ord + cypher_jump
      cypher_char = cypher_ascii_code.chr
      cypher_ascii_code -= _match_char_and_cypher_cases(character, cypher_char) * negative_jump
      cypher_ascii_code.chr
    else
      character
    end
  end.join
end

def caesar_cipher(initial_text, cypher_jump)
  return 'Incorrect shift value' unless cypher_jump.is_a? Integer

  negative_jump = _handle_negative_jump(cypher_jump)
  cypher_jump = _handle_values_over_26(cypher_jump) * negative_jump

  _shift_characters(initial_text, cypher_jump, negative_jump)
end

print caesar_cipher('uvW1@abCe', -3)
print caesar_cipher('What a string!', 5)
