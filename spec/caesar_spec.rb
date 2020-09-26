# frozen_string_literal: true

require './lib/caesar'

describe '#caesar_cipher' do
  it 'stops if shift value is float' do
    expect(caesar_cipher('abcde', 5.1)).to eql('Incorrect shift value')
  end

  it 'stops if shift value is letter' do
    expect(caesar_cipher('abcde', 'a')).to eql('Incorrect shift value')
  end

  it 'shifts letters the correct value' do
    expect(caesar_cipher('abcde', 5)).to eql('fghij')
  end

  it 'only shifts letters, not other characters' do
    expect(caesar_cipher('ab1c@d:e', 5)).to eql('fg1h@i:j')
  end

  it 'keeps letter case' do
    expect(caesar_cipher('abCde', 5)).to eql('fgHij')
  end

  it 'wraps when letter is at the end of alphabet' do
    expect(caesar_cipher('uvWxy', 5)).to eql('zaBcd')
  end

  it 'works with negative shift values' do
    expect(caesar_cipher('uvW1@abCe', -3)).to eql('rsT1@xyZb')
  end

  it 'works with shift values greater than -26' do
    expect(caesar_cipher('uvW1@abCe', -55)).to eql('rsT1@xyZb')
  end

  it 'works with shift values greater than 26' do
    expect(caesar_cipher('ab1c@d:e', 31)).to eql('fg1h@i:j')
  end
end
