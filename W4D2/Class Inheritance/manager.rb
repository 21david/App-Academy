require_relative 'employee.rb'

class Manager < Employee
    attr_accessor :employees

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
shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
darren = Manager.new('Darren', 'TA Manager', 78000, 'Ned')
ned = Manager.new('Ned', 'Founder',  1000000, nil)

ned.employees = [darren]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
