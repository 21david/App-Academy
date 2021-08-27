# json.set! @party.id do 
#     json.extract! @party, :name, :location

#     json.

json.extract! @party, :name, :location

json.guests do |blah| 

    json.array! @party.guests do |guest|
        json.name guest.name
        json.gifts guest.gifts, :title
        # json.array! guest.gifts, :title, :description


        # json.set! guest.name do 
        #     json.array! guest.gifts, :title, :description
        # end
    end
end

# json.extract! @party, :name, :location
# debugger
# json.array! party.guests, :name
# json.party.guests.gifts