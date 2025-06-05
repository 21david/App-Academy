class Item

    def initialize(title, deadline, desc)
        @title = title
        
        if(Item.valid_date?(deadline))
            @deadline = deadline
        else
            raise "Not a valid date for deadline."
        end

        @description = desc
    end

    def title
        @title
    end

    def title=(new_title)
        @title = new_title
    end

    def deadline
        @deadline
    end

    def deadline=(new_deadline)
        if(Item.valid_date?(new_deadline))
            @deadline = new_deadline
        else
            raise "Not a valid date for deadline."
        end
    end

    def description
        @description
    end

    def description=(new_description)
        @description = new_description
    end

    # date should be a string in format "YYYY-MM-DD"
    def self.valid_date?(date)
        return false if date.length != 10 || date[4] != '-' || date[7] != '-'

        year = date[0..3] # should be 4 digit #
        month = date[5..6]
        day = date[8..9]

        # each must contain only numbers 0-9
        year.each_char { |d| return false if !d.match?(/[[:digit:]]/) } # return false if any digit is not a number
        month.each_char { |d| return false if !d.match?(/[[:digit:]]/) } # return false if any digit is not a number
        day.each_char { |d| return false if !d.match?(/[[:digit:]]/) } # return false if any digit is not a number
        
        # convert to integers
        year_int = year.to_i
        month_int = month.to_i
        day_int = day.to_i

        # if month is out of range (range is 1 through 12), return false
        if month_int <= 0 || month_int > 12
            return false
        end

        # if day is out of range (range is 1 through 31), return false
        if day_int <= 0 || day_int > 31
            return false
        end

        # else, everything seems right
        true
    end

end
