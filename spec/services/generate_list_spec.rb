require 'rails_helper'

describe Generate_List do

  let(:subject){Generate_List}

  before(:each) do
    convert_class = class_double('Convert_Number')
    allow(convert_class).to receive(:convert).with(1) {'one'}
    allow(convert_class).to receive(:convert).with(2) {'two'}
    allow(convert_class).to receive(:convert).with(3) {'three'}
    allow(convert_class).to receive(:convert).with(4) {'four'}
    allow(convert_class).to receive(:convert).with(5) {'five'}
  end


  it "should be able to take a number as an argument" do
    expect(subject).to respond_to(:generate).with(1).argument
  end

  it 'should generate a list of number in english' do
    subject.generate 5
    numbers = Number.all
    names = []
    numbers.each do |n|
      names << n.name
    end
    expect(names).to eq ["one","two","three","four","five"]
  end

end
