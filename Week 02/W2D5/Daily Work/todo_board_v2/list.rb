require_relative 'item'

class List

    def initialize(label)
        @label = label
        @items = []
    end

    def label
        @label
    end

    def label=(val)
        @label = val
    end

    def size
        @items.length
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def add_item(title, deadline, desc="")
        begin
            item = Item.new(title, deadline, desc)
        rescue
            #if deadline was not valid, return false and don't add the item
            return false
        end

        @items << item
        true
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        true
    end

    def purge
        # iterating backwards to prevent it from skipping
        # indices whenever an element is deleted
        i = @items.length-1
        while i >= 0
            remove_item(i) if @items[i].status  # if task is done, remove it
            i -= 1
        end
    end

    def valid_index?(index)
        index >= 0 && index < @items.length
    end

    def swap(index_1, index_2)
        return false if !valid_index?(index_1) || !valid_index?(index_2)

        # if indices are ok, then swap
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        true
    end

    def [](i)
        return nil if !valid_index?(i)
        @items[i]
    end

    def priority
        @items[0]
    end

    def print_all
        # width determines the width of the output (# of characters it takes up horizontally)
        width = 60  # recommended minimum of ~50

        puts '-' * width
        # length is 70 
        # 70 - length of string = spaces to the left and right (combined)
        # / 2 = spaces to the left and right (each)
        label_length = @label.length
        spaces_total = width - label_length
        spaces = spaces_total / 2

        print ' ' * spaces 
        print @label.upcase
        print ' ' * spaces
        puts 

        puts '-' * width
        puts "Index | Item#{' ' * (width - 37)}| Deadline   | Status" # (width - 15) spaces total in between
        puts '-' * width
        # print items in list
        
        @items.each_with_index do |item, i|
            completed = item.status ? "✅" : ""
            print "#{i.to_s.ljust(6)}| #{item.title.ljust(width - 33)}| #{item.deadline} | #{completed}\n"
        end

        puts '-' * width
    end

    def print_full_item(index)
        return if !valid_index?(index)
        puts '------------------------------------------'
        print @items[index].title.ljust(27)
        print @items[index].deadline
        status = @items[index].status ? "✅" : "✖"
        puts "   #{status}"
        if @items[index].description.length > 0
            puts @items[index].description
        else
            puts '(No description)'
        end
        puts '------------------------------------------'
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amt=1)
        return false if !valid_index?(index)
        amt.times do
            return true if index == 0
            swap(index, index-1)
            index -= 1
        end
        true
    end

    def down(index, amt=1)
        return false if !valid_index?(index)
        amt.times do
            return true if index == @items.length-1
            swap(index, index+1)
            index += 1
        end
        true
    end

    def sort_by_date!
        @items.sort_by! { |item| item.deadline }
    end
end