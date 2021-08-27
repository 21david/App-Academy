json.extract! @party, :name, :location

json.guests do |blah| 

    json.array! @party.guests do |guest|
        json.name guest.name
        json.gifts guest.gifts, :title
        # json.array! guest.gifts, :title, :description
        # Sip.all.includes(:author)

        # json.set! guest.name do 
        #     json.array! guest.gifts, :title, :description
        # end
    end
end

