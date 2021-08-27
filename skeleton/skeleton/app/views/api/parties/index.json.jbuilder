json.array! @parties do |party|
    json.name party.name
    json.location party.location
    json.array! party.guests, :name
end