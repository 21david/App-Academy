class Card
    attr_reader :value, :is_face_up

    def initialize(value)
        @is_face_up = false
        @value = value 
    end

    def hide
        @is_face_up = false     
    end 

    def reveal
        @is_face_up = true 
    end 

    def ==(other_card)
        self.value == other_card.value
    end 

    def to_s
        if @is_face_up 
            print @value.to_s
        else  
            print " " 
        end 
    end

end     