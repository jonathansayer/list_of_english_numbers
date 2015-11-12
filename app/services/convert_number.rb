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
          '4' => 'forty',
          '5' => 'fifty',
          '6' => 'sixty',
          '7' => 'seventy',
          '8' => 'eighty',
          '9' => 'ninety'}

@teens = { '11' => 'eleven',
           '12' => 'twelve',
           '13' => 'thirteen',
           '14' => 'fourteen',
           '15' => 'fifteen',
           '16' => 'sixteen',
           '17' => 'seventeen',
           '18' => 'eighteen',
           '19' => 'nineteen'}

  def self.convert number
    number = number.to_s
    return @numbers[number] if number.length == 1
    return @tens[number[0]] if number.length == 2 and number[1] == '0'
    return @teens[number] if self.is_teen? number
    return (@tens[number[0]] + '-' + @numbers[number[1]]) if number.length == 2 and !self.is_teen? number
  end

  private

  def self.is_teen? number
    return true if number.length == 2 and number[0] == '1'
    return false
  end

end
