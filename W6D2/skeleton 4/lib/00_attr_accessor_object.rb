class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      instance = name.to_s
      instance_eq = name.to_s + '='
      define_method(instance) { self.instance_variable_get('@'+instance) }
      define_method(instance_eq) { |val| self.instance_variable_set('@'+instance, val) }
    end
  end
end

# x.print 
