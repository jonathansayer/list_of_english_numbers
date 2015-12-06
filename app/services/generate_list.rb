class Generate_List

  attr_reader :list

  def self.generate number
    number.times do |n|
      Number.create(name: Convert_Number.convert(n+1))
    end
  end
end
