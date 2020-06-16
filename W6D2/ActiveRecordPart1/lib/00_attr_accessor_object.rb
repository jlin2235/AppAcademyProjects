class AttrAccessorObject
  def self.my_attr_accessor(*names)
      names.each do |name|
        define_method(name) do
          self.instance_variable_get("@#{name}")
        end
    end

      names.each do |name| #name = symbols 
        define_method("#{name}=") do |val|
          self.instance_variable_set("@#{name}",val)

          # "@#{name}"
        end
    end


    # def age=(val)
     # self.instance_variable_set("@age",val)
      # @age = val


  end

end
