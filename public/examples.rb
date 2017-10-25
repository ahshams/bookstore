class Room
  def initialize
    @doors = 1
    @windows = 1
  end

  attr_accessor :doors, :windows

=begin
  def doors(value)
    @doors = value
  end

  def windows=(value)
    @windows = value
  end
=end
end

class Garage < Room
  def initialize
    @tools = 1
  end

  attr_accessor :tools
end

kitchen = Room.new
kitchen.doors = 1
kitchen.windows = 2

puts "Number of kitchen doors: #{kitchen.doors}"
puts "Number of kitchen windows: #{kitchen.windows}"

spanner = Garage.new
spanner.tools = 5

cabin = Garage.new.doors = 4
#cabin.doors = 2

puts "Number of spanners: #{spanner.tools}"
#puts "Number of doors in cabin: #{cabin.doors}"

