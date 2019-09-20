class Rover
  attr_accessor :x, :y, :position

  def initialize(x, y, pos, b_x, b_y)
    @x = x
    @y = y
    @position = pos
    @b_x = b_x
    @b_y = b_y
  end

  def move(direction, axis)
    if direction == "f" && axis == "x"
      increment_x
      check_coords
    elsif direction == "r" && axis == "x"
      decrement_x
      check_coords
    elsif direction == "f" && axis == "y"
      increment_y
      check_coords
    else
      decrement_y
      check_coords
    end
  end

  def get_direction
    @position
  end

  def change_direction(turning_direction)
    direction_lambda = lambda { |turning_dir, curr_pos|
      case curr_pos
      when "N"
        case turning_dir
        when "L"
          @position = "W"
        when "R"
          @position = "E"
        end
      when "S"
        case turning_dir
        when "L"
          @position = "E"
        when "R"
          @position = "W"
        end
      when "W"
        case turning_dir
        when "L"
          @position = "S"
        when "R"
          @position = "N"
        end
      else
        case turning_dir
        when "L"
          @position = "N"
        when "R"
          @position = "S"
        end
      end
    }
    @position = direction_lambda.(turning_direction, @position)
  end

  def print_coords
    print "Result ", " ", @x, " ", @y, " ", @position, "\n"
  end

  def check_coords
    if @x > @b_x || @y > @b_y || @x < 0 || @y < 0
      print "Hey ! You are accessing me outside the Box"
      false
    else
      true
    end
  end

  def decrement_x
    @x -= 1
  end

  def increment_x
    @x += 1
  end

  def decrement_y
    @y -= 1
  end

  def increment_y
    @y += 1
  end
end

box_coords = gets.chomp.split(" ")
box_x = box_coords[0].to_i
box_y = box_coords[1].to_i

puts "Enter the test cases"
test_cases = gets.chomp.to_i

while test_cases > 0
  puts "Enter the coordinates and Position"
  initial_coords = gets.chomp
  positions = initial_coords.split(" ")
  init_x = positions[0].to_i
  init_y = positions[1].to_i
  init_pos = positions[2]

  puts "Enter the directions"
  directions = gets.chomp.split("")

  rover = Rover.new(init_x, init_y, init_pos, box_x, box_y)
  directions.each { |dir|
    case dir
    when "M"
      case rover.get_direction
      when "N"
        rover.move("f", "y")
      when "S"
        rover.move("r", "y")
      when "E"
        rover.move("f", "x")
      else
        rover.move("r", "x")
      end
    when "L"
      rover.change_direction("L")
    when "R"
      rover.change_direction("R")
    end
  }
  if !rover.check_coords
    print "Hey ! You are accessing me outside the Box \n"
  else
    rover.print_coords
  end
  test_cases -= 1
end
