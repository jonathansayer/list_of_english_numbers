require 'rails_helper'

describe ConvertNumber do
  let(:subject){ConvertNumber}

  it'should take a number and convert it words' do
    expect(subject).to respond_to(:convert).with(1).argument
  end

  context 'converting single digit numbers' do

    it'should convert the number 1 to the word one' do
      expect(subject.convert 1).to eq 'one'
    end

    it'should convert the number 2 to the word two' do
      expect(subject.convert 2).to eq 'two'
    end

    it'should cconvert the number 8 to the word "eigth"' do
      expect(subject.convert 8).to eq 'eight'
    end
  end

  context 'converting double digit numbers' do

    it'should convert the number 10 to the word "ten"' do
      expect(subject.convert 10).to eq 'ten'
    end

  end

end
