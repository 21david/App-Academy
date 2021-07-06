require_relative 'employee.rb'

class Manager < Employee

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        sum = 0
        queue = @employees
        until queue.empty?
            first = queue.shift
            sum += first.salary
            queue += first.employees if first.is_a?(Manager)
        end
        sum * multiplier
    end

end

david = Employee.new('David', 'TA', 10000, 'Darren')