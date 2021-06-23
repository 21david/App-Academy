require_relative "code"

class Mastermind
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(code_obj)
        puts "Exact matches: #{@secret_code.num_exact_matches(code_obj)}"
        puts "Near matches: #{@secret_code.num_near_matches(code_obj)}"
    end

    def ask_user_for_guess
        puts 'Enter a code'
        user_code_obj = Code.from_string(gets.chomp)
        print_matches(user_code_obj)
        @secret_code == user_code_obj
    end
end
