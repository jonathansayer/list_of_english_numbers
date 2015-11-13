class Generate_List

  attr_reader :list

  def self.generate number
    @list = []
    n = 1
    while n <= number
      @list.push(Convert_Number.convert n)
      n = n + 1
    end
    return @list
  end
end
