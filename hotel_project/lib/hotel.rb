require_relative "room"

class Hotel
  def initialize(str, rooms_hash)
    @name = str
    @rooms = rooms_hash
    @rooms.each_key do |key|
        @rooms[key] = Room.new(@rooms[key])
    end
  end

  def name
    return @name.split.map(&:capitalize).join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(str)
    @rooms.has_key?(str)
  end

  def check_in(person, room_name)
    if room_exists?(room_name)
        attempt = @rooms[room_name].add_occupant(person)
        if attempt
            puts 'check in successful'
        else
            puts 'sorry, room is full'
        end
    else
        puts 'sorry, room does not exist'
    end
  end

  def has_vacancy?
    # iterate through all rooms, calling full? on them
    @rooms.each_value do |room|
        return true if !room.full?
    end
    false
  end

  def list_rooms
    @rooms.each_pair do |room_name, room|
        puts room_name + ": " + room.available_space.to_s
    end
  end
end
