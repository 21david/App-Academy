class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name, @slogan, @student_capacity = name, slogan, student_capacity
    @teachers, @students = [], []
    @grades = Hash.new { |hash, k| hash[k] = Array.new } # gets used for every key that is referenced for the 1st time
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
        @students << student
        return true
    else
        return false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    @students.length / @teachers.length
  end

  def add_grade(student, grade)
    if enrolled?(student)
        @grades[student] << grade
        return true
    else
        return false
    end
  end

  def num_grades(student)
    @grades[student].length
  end

  def average_grade(student)
    if enrolled?(student)
        sum = @grades[student].sum
        begin
            return sum / num_grades(student)
        rescue
            return nil
        end
    else
        return nil
    end
  end
end
