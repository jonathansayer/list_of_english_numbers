require 'rails_helper'

describe ConvertNumber do

  it'should take a number and convert it words' do
    expect(subject).to respond_to(:convert).with(1).argument
  end

  it'should convert the number 1 to the word one' do
    expect(subject.convert 1).to eq 'one'
  end
end
