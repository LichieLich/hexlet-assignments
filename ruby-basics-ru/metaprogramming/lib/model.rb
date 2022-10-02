# frozen_string_literal: true

# BEGIN
module Model
  module ClassMethods
    def defaults
      @defaults ||= {}
    end
    
    def add_default_value(name, value)
      defaults[name] = value
    end

    def all_attributes
      @all_attributes ||= []
    end

    def attribute(name, options = {})
      all_attributes << name
      add_default_value(name, options[:default])
      define_method "#{name}" do
        self.instance_variable_get "@#{name}"
      end
      define_method "#{name}=" do |value|
        self.instance_variable_set "@#{name}", convert_type(value, options[:type])
      end 
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end 

  def initialize(params = self.class.defaults)
    self.class.defaults.each { |name, default_value| params[name] ||= default_value }
    params.each { |name, value| public_send("#{name}=", value) }
  end

  def convert_type(value, type)
    return nil if value.nil?
    case type
      when :integer
        value.to_i
      when :string
        value.to_s
      when :boolean
        value
      when :datetime
        DateTime.parse(value)
    end
  end

  def attributes
    self.class.all_attributes.each_with_object({}) do |var, hash|
      hash[var] = instance_variable_get "@#{var}"
    end
  end
end
# END
