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

    it 'should convert the number 20 to the word "twenty"' do
      expect(subject.convert 20).to eq 'twenty'
    end

    it 'should convert the number 70 to the word "seventy"' do
      expect(subject.convert 70).to eq 'seventy'
    end

    it 'should convert the number 21 to the word "twenty-one"' do
      expect(subject.convert 21).to eq "twenty-one"
    end

    it 'should convert the number 46 to the word "forty-six"' do
      expect(subject.convert 46).to eq "forty-six"
    end

    it 'should convert the number 99 to the word "ninety-nine"' do
      expect(subject.convert 99).to eq "ninety-nine"
    end 
  end

  context 'converting teen numbers' do

    it 'should convert the number 11 to the word "eleven"' do
      expect(subject.convert 11).to eq 'eleven'
    end

    it 'should convert the number 13 to the word "thirteen"' do
      expect(subject.convert 13).to eq 'thirteen'
    end

    it 'should convert the number 19 to the word "nineteen"' do
      expect(subject.convert 19).to eq 'nineteen'
    end

  end

end
