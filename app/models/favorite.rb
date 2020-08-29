class Favorite
  attr_reader :contents

  def initialize(initial_content)
    @contents = initial_content || Array.new
  end
end
