json.extract! @party, :name, :location


json.guests do |blah| 

    json.array! @party.guests do |guest|
        json.name guest.name
        json.gifts guest.gifts, :title
        # .includes(:title)
        # Sip.all.includes(:author)

    end
end

