class Flight

    def initialize(num, cap)
        @flight_number = num
        @capacity = cap
        @passengers = []
    end

    attr_reader :passengers

    def full?
        @passengers.length == @capacity
    end

    def board_passenger(passenger)
        if !full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        passengers = []
        @passengers.each do |p|
            passengers << p.name
        end
        passengers
    end

    def [](i)
        @passengers[i]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end