require_relative 'list.rb'

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print 'Enter a command: '
        cmd, *args = gets.chomp.split

        case cmd
        when 'mktodo'
            @list.add_item(*args)
        when 'up'
            if args.length == 1
                @list.up(args[0].to_i)
            elsif args.length == 2
                @list.up(args[0].to_i, args[1].to_i)
            end
        when 'down'
            if args.length == 1
                @list.down(args[0].to_i)
            elsif args.length == 2
                @list.down(args[0].to_i, args[1].to_i)
            end
        when 'swap'
            @list.swap(args[0].to_i, args[1].to_i) if args.length == 2
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_priority
        when 'print'
            if args.length == 0
                @list.p
            elsif args.length == 1
                @list.print_full_item(args[0].to_i)
            end
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