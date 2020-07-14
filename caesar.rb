def caesar_cipher(initial_text, cypher_jump)
    return "Incorrect shift value" unless cypher_jump.is_a? Integer 
    cypher_jump = cypher_jump < 0 ? -(-cypher_jump%26) : cypher_jump % 26 
    initial_text.chars.map do |character|
        if character =~ /[A-Za-z]/
            cypher_ascii_code = character.ord + cypher_jump
            cypher_char = cypher_ascii_code.chr
            if character =~ /[A-Z]/ && !(cypher_char =~ /[A-Z]/)
                cypher_ascii_code -= 26
            elsif character =~ /[a-z]/ && !(cypher_char =~ /[a-z]/)
                cypher_ascii_code += 26
            end
            cypher_char = cypher_ascii_code.chr
        else
            character
        end
    end.join()
end

print caesar_cipher("What a string!", 5)