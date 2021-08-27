# json.set! @party.id do 
#     json.extract! @party, :name, :location

#     json.

json.extract! @party, :name, :location

json.guests do |guest| 
    json.array! 
end

# json.extract! @party, :name, :location
# debugger
# json.array! party.guests, :name
# json.party.guests.gifts