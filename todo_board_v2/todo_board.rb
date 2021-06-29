require_relative 'list.rb'

# Possible features to add:
#  - allow user to enter command like 'help mktodo'
#    to get more info on only that command
#  - Allow width of print screen to be resizeable using a command like 'width 80'
#       - width variable in List#print_all can be turned into a global variable
#         that can be changed with the 'width' command

class TodoBoard
    def initialize
        # @list = List.new(label)
        @lists_hash = {}  # list label (key) => list instance (value)
    end


    def self.print_invalid_args_message(num_of_args_required)
        puts "Invalid number of arguments. #{num_of_args_required} required. Enter 'help-detailed' for command info."
    end

    def get_command
        print 'Enter a command: '
        cmd, *args = gets.chomp.split

        case cmd
        
        # mklist <new_list_label>
        when 'mklist'
            if args.length == 1
                label = args[0]
                @lists_hash[label] = List.new(label)
            else
                TodoBoard.print_invalid_args_message(1)
            end

        # ls
        when 'ls'
            if args.length == 0
                puts "Current lists: "
                @lists_hash.each_key { |k| puts "   #{k}" }
            else
                TodoBoard.print_invalid_args_message(0)
            end

        # showall
        when 'showall'
            if args.length == 0
                @lists_hash.each_value do |v| 
                    v.print_all
                    puts
                end
            else
                TodoBoard.print_invalid_args_message(0)
            end

        # mktodo <list_label> <item_title> <item_deadline> <optional_item_description>
        when 'mktodo'
            if args.length == 3 || args.length == 4
                list = args[0]
                args.delete_at(0)
                @lists_hash[list].add_item(*args)
            else
                TodoBoard.print_invalid_args_message("3 or 4")
            end

        # up <list_label> <item_index> <optional_amount>
        when 'up'
            if args.length == 2 || args.length == 3
                list = args[0]
                args.delete_at(0)
                if args.length == 1
                    @lists_hash[list].up(args[0].to_i)
                elsif args.length == 2
                    @lists_hash[list].up(args[0].to_i, args[1].to_i)
                end
            else
                TodoBoard.print_invalid_args_message("2 or 3")
            end

        # down <list_label> <item_index> <optional_amount>
        when 'down'
            if args.length == 2 || args.length == 3
                list = args[0]
                args.delete_at(0)
                if args.length == 1
                    @lists_hash[list].down(args[0].to_i)
                elsif args.length == 2
                    @lists_hash[list].down(args[0].to_i, args[1].to_i)
                end
            else
                TodoBoard.print_invalid_args_message("2 or 3")
            end

        # swap <list_label> <item_index_1> <item_index_2>
        when 'swap'
            if args.length == 3
                list = args[0]
                args.delete_at(0)
                @lists_hash[list].swap(args[0].to_i, args[1].to_i) 
            else
                TodoBoard.print_invalid_args_message(3)
            end

        #sort <list_label>
        when 'sort'
            if args.length == 1
                list = args[0]
                @lists_hash[list].sort_by_date!
            else
                TodoBoard.print_invalid_args_message(1)
            end

        # priority <list_label>
        when 'priority'
            if args.length == 1
                list = args[0]
                @lists_hash[list].print_priority
            else
                TodoBoard.print_invalid_args_message(1)
            end

        # print <list_label> <optional_index>
        when 'print'
            if args.length == 1 || args.length == 2
                list = args[0]
                args.delete_at(0)
                if args.length == 0
                    @lists_hash[list].print_all
                elsif args.length == 1
                    @lists_hash[list].print_full_item(args[0].to_i) 
                end
            else
                TodoBoard.print_invalid_args_message("1 or 2")
            end

        # toggle <list_label> <item_index>
        when 'toggle'
            if args.length == 2
                list = args[0]
                args.delete_at(0)
                @lists_hash[list].toggle_item(args[0].to_i)
            else
                TodoBoard.print_invalid_args_message(2)
            end

        # rm <list_label> <item_index>
        when 'rm'
            if args.length == 2
                list = args[0]
                args.delete_at(0)
                @lists_hash[list].remove_item(args[0].to_i) 
            else
                TodoBoard.print_invalid_args_message(2)
            end

        # purge <list_label>
        when 'purge'
            if args.length == 1
                list = args[0]
                @lists_hash[list].purge
            else
                TodoBoard.print_invalid_args_message(1)
            end

        # quit
        when 'quit'
            return false
        
        # help
        when 'help'
            TodoBoard.display_commands

        # would be cool to let user input something like:
        # help swap
        # help mklist
        # help mktodo

        # help-detailed
        when 'help-detailed'
            TodoBoard.display_commands_long

        else
            puts "Sorry, that command is not recognized. Check for typos, or type 'help' or 'help-detailed' for available commands."
        end

        true
    end

    def self.display_commands
        puts "Available commands are: "
        puts "  mklist"
        puts "  mktodo"
        puts "  ls"
        puts "  showall"
        puts "  toggle"
        puts "  rm"
        puts "  purge"
        puts "  up"
        puts "  down"
        puts "  swap"
        puts "  sort"
        puts "  priority "
        puts "  print"
        puts "  help"
        puts "  help-detailed"
        puts "  quit"
    end

    def self.display_commands_long
        puts "Available commands are: "
        puts "mklist <new list label>"
        puts "    - creates a list with the given label"
        puts "mktodo <list label> <item title> <item deadline> <optional description>"
        puts "    - adds an item to the given list"
        puts "ls"
        puts "    - prints all current list labels"
        puts "showall"
        puts "    - prints all lists in their entirety"
        puts "toggle <list label> <item index>"
        puts "    - mark an item as complete or uncomplete in the given list"
        puts "rm <list label> <item index>"
        puts "    - removes an item from a list"
        puts "purge <list label>"
        puts "    - removes all completed items from a list"
        puts "up <list label> <item index> <optional amount>"
        puts "    - moves an item up in a list by the given amount (or 1 by default)"
        puts "down <list label> <item index> <optional amount>"
        puts "    - moves an item donw in a list by the given amount (or 1 by default)"
        puts "swap <list label> <item index 1> <item index 2>"
        puts "    - swaps the positions of two items in the given list"
        puts "sort <list label>"
        puts "    - sorts all items in the given list by their deadline, ascending"
        puts "priority <list label>"
        puts "    - prints the first item in the given list"
        puts "print <list label> <optional index>"
        puts "    - prints the given list"
        puts "    - if an index is given, it prints information about only that item"
        puts "help"
        puts "    - see available commands"
        puts "help-detailed"
        puts "    - see available commands with explanations"
        puts "quit"
        puts "    - exit out of the program"
    end

    def run
        while get_command
        end

    end

end


# run the program
TodoBoard.new.run