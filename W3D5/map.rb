class Map
#  set(key, value), get(key), delete(key), show

    def initialize
        @data = []
    end

    def set(key, value)
        # check if key is already in @data
        # iterate through all pairs, looking at their key
        @data.each_with_index do |key_value, i|
            if key_value[0] == key
                # update
                @data[i] = [key, value]
                
            end
        end

        # if it wasn't in @data, then we may add it
        @data << [key, value]
    end

    def get(key)
        # iterate through @data, looking for key
        @data.each_with_index do |key_value, i|
            if key_value[0] == key
                # return value for that key
                return key_value[1]
            end
        end

        # if not found, I will return nil
        nil
    end

    def delete(key)
        # iterate through @data, looking for key
        @data.each_with_index do |key_value, i|
            if key_value[0] == key
                # delete it
                @data.delete_at(i)
            end
        end
    end

    def show
        def format(arr)
            arr[0].inspect.to_s + "=>" + arr[1].inspect.to_s
        end
        str = "{"
        (0...@data.length-1).each do |i|
            str += format(@data[i])
            str += ", "
        end
        str += format(@data[-1]) if @data.length >= 1
        str += "}"

        # print the result
        puts str
    end
end

map = Map.new

map.set("david", 10)
map.set("john", 9)
map.set("mary", 9)
map.set("jim", 10)
map.show  # {"david"=>10, "john"=>9, "mary"=>9, "jim"=>10}

p map.get("john") # 9
map.delete("john")
p map.get("john") # nil
map.show # {"david"=>10, "mary"=>9, "jim"=>10}

p map.get("potato")  # nil


