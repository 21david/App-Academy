require_relative 'list.rb'

class TodoBoard
    def initialize(label)
        # @list = List.new(label)
        @lists_hash = {}  # list label (key) => list instance (value)
    end

    def get_command
        print 'Enter a command: '
        cmd, *args = gets.chomp.split

        case cmd
        when 'mklist'
            label = args[0]
            @lists_hash[label] = List.new(label)
        when 'ls'
            puts "Current lists: "
            @lists_hash.each_key { |k| puts k }
        when 'showall' 
            @lists_hash.each_value do |v| 
                v.p
                puts
            end
        when 'mktodo'
            if args.length == 4
                list = args[0]
                args.delete_at(0)
                @lists_hash[list].add_item(*args)
            end
        when 'up'
            list = args[0]
            args.delete_at(0)
            if args.length == 1
                @lists_hash[list].up(args[0].to_i)
            elsif args.length == 2
                @lists_hash[list].up(args[0].to_i, args[1].to_i)
            end
        when 'down'
            list = args[0]
            args.delete_at(0)
            if args.length == 1
                @lists_hash[list].down(args[0].to_i)
            elsif args.length == 2
                @lists_hash[list].down(args[0].to_i, args[1].to_i)
            end
        when 'swap'
            if args.length == 3
                list = args[0]
                args.delete_at(0)
                @lists_hash[list].swap(args[0].to_i, args[1].to_i) 
            end
        when 'sort'
            if args.length == 1
                list = args[0]
                @lists_hash[list].sort_by_date!
            end
        when 'priority'
            if args.length == 1
                list = args[0]
                @lists_hash[list].print_priority
            end
        when 'print'
            list = args[0]
            args.delete_at(0)
            if args.length == 0
                @lists_hash[list].p
            elsif args.length == 1
                @list.print_full_item(args[0].to_i) 
            end
        when 'toggle'
            list = args[0]
            args.delete_at(0)
            @lists_hash[list].toggle_item(args[0].to_i)
        when 'rm'
            list = args[0]
            args.delete_at(0)
            @lists_hash.remove_item(args[0].to_i) 
        when 'purge'
            list = args[0]
            @lists_hash[list].purge
        when 'quit'
            return false
        else
            puts 'Sorry, that command is not recognized'
        end

        true
    end

    def run
        while get_command
        end

    end

end