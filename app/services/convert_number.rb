class Convert_Number

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
    return 'one million' if number == 1000000
    number = number.to_s
    return @numbers[number] if number.length == 1
    return self.tens number if number.length == 2
    return self.hundreds number if number.length == 3
    return self.thousands number if number.length == 4
    return self.hundreds_of_thousands number if number.length > 4
  end

  private

  def self.hundreds_of_thousands number
    split_number = number.split(//, number.length - 2)
    number_of_thousands = split_number.reverse.drop(1).reverse.join('')
    thousands = self.convert number_of_thousands
    hundreds = self.convert split_number.last
    return thousands + ' thousand ' + hundreds
  end

  def self.thousands number
    return @numbers[number[0]] + ' thousand' if number[1] + number[2] + number[3] == '000'
    return @numbers[number[0]] + ' thousand and ' + self.hundreds(number[1] + number[2] + number[3])
  end

  def self.hundreds number
    return '' if number[0] == '0'
    return @numbers[number[0]] + ' hundred' if number[1] == '0' and number[2] == '0'
    return @numbers[number[0]] + ' hundred and ' + self.tens(number[1] + number[2])
  end

  def self.tens number
    return @tens[number[0]] if number.length == 2 and number[1] == '0'
    return @teens[number] if self.is_teen? number
    return (@tens[number[0]] + " " + @numbers[number[1]]) if number.length == 2 and !self.is_teen? number
  end

  def self.is_teen? number
    return true if number.length == 2 and number[0] == '1'
    return false
  end

end
