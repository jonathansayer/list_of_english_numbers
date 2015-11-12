class ConvertNumber

@numbers = { '1' => 'one',
             '2' => 'two',
             '3' => 'three',
             '4' => 'four',
             '5'=> 'five',
             '6' => 'six',
             '7' => 'seven',
             '8' => 'eight',
             '9' => 'nine'}

@tens = { '1' => 'ten',
          '2' => 'twenty',
          '3' => 'thirty',
          '4' => 'fourty',
          '5' => 'fifty',
          '6' => 'sixty',
          '7' => 'seventy',
          '8' => 'eighty',
          '9' => 'ninety'}

  def self.convert number
    number = number.to_s
    return @numbers[number] if number.length == 1
    return @tens[number[0]] if number.length == 2
  end

end
