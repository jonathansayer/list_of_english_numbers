class Convert_Number

@numbers = { 1 => 'one',
             2 => 'two',
             3 => 'three',
             4 => 'four',
             5 => 'five',
             6 => 'six',
             7 => 'seven',
             8 =>  'eight',
             9 => 'nine'}

@tens = [ 'ten',
          'twenty',
          'thirty',
          'forty',
          'fifty',
          'sixty',
          'seventy',
          'eighty',
          'ninety']

@teens = [ 'eleven',
           'twelve',
           'thirteen',
           'fourteen',
           'fifteen',
           'sixteen',
           'seventeen',
           'eighteen',
           'nineteen']

  @big_numbers = [ [2, 'hundred'],
                 [3, 'thousand'],
                 [6, 'million'],
                 [9, 'billion']]

  def self.convert number
    big_pair = @big_numbers.pop
    prefix = big_pair[1]
    power = 10 ** big_pair[0]
    number = number/power
    num_string = @numbers[number] +" " +  prefix
  end

  # def self.convert number
  #   number = number.to_s
  #   return @numbers[number] if number.length == 1
  #   return self.tens number if number.length == 2
  #   return self.hundreds number if number.length == 3
  # end

  private

  def self.hundreds number
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
