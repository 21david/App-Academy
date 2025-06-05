require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries_hash)
        @name, @funding, @salaries = name, funding, salaries_hash
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(empl_name, title)
        if !valid_title?(title)
            raise Error
        else
            @employees << Employee.new(empl_name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(emp)
        emp_title = emp.title
        emp_salary = @salaries[emp_title]

        if @funding >= @salaries[emp_title] # if we can afford it
            emp.pay(emp_salary) # pay the employee
            @funding -= emp_salary
        else
            raise Error
        end
    end

    def payday
        # call pay_employee for every employee
        @employees.each do |emp|
            pay_employee(emp)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |emp|
            sum += @salaries[emp.title]
        end
        sum / @employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        # add startup's salaries to our salaries, without any overriding
        startup.salaries.each do |k, v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end

        startup.employees.each do |emp|
            @employees << emp
        end

        startup.close
    end


end
