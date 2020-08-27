class Favorite
  attr_reader :contents

  def initialize(initial_content)
    @contents = initial_content || Array.new
  end

  # def count
  #   @contents.values.sum
  # end
end
