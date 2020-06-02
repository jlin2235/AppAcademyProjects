
class Employee 
    attr_accessor  :name, :title, :salary, :boss

    def initialize(name, title, salary, boss= nil)
        @name = name
        @title = title 
        @salary = salary
        self.boss = boss
    end

    def boss=(boss)
        @boss = boss 
        if !boss.nil?
          self.boss.employees << self
        end
    end

    def bonus(multiplier)
        @salary * multiplier
    end

end

class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss= nil)
        @employees = []
        super
    end

    def bonus(multiplier)
        self.total_salary * multiplier
    end

    # def total_salary
    #     queue = [] + self.employees
    #     total_sum = 0
    #     until queue.empty?
    #         employee = queue.shift
    #         total_sum += employee.salary
    #         if employee.is_a?(Manager) 
    #             queue += employee.employees
    #         end
    #     end
    #     total_sum
    # end

    def total_salary
        total_sum = 0
        self.employees.each do |employee|
            total_sum += employee.salary
            total_sum += employee.total_salary if employee.is_a?(Manager)
        end
        total_sum
    end


end




# ned = Manager.new('Ned', 'Founder', 1000000)
# darren = Manager.new('Darren', 'TA Manager', 78000, ned)
# shawna = Employee.new('Shawna', 'TA', 12000, darren)
# david = Employee.new('David', 'TA', 10000, darren)