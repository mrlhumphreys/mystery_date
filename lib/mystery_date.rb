require "mystery_date/version"

module MysteryDate
  require 'mystery_date/railtie' if defined?(Rails)
  
  module ClassMethods
    def has_mystery_date *names
      if names.empty?
        validates :year, :numericality => true, :allow_nil => true
        validates :month, :numericality => true, :inclusion => { :in => 1..12 }, :allow_nil => true
        validates :day, :numericality => true, :inclusion => { :in => 1..31 }, :allow_nil => true
        validate :date_values
        
        define_method :date do
          year = send :year
          month = send :month
          day = send :day
          Date.new(year, month, day) if year && month && day && Date.valid_date?(year, month, day)
        end
            
        define_method :date_values do
          year = send :year
          month = send :month
          day = send :day
        
          if year && month && day
            errors.add(:base, "#{day}/#{month}/#{year} is not a valid date" ) unless Date.valid_date?(year.to_i, month.to_i, day.to_i)
          end
        end
        
      else
        names.each do |name|
          validates "#{name}_year".to_sym, :numericality => true, :allow_nil => true
          validates "#{name}_month".to_sym, :numericality => true, :inclusion => { :in => 1..12 }, :allow_nil => true
          validates "#{name}_day".to_sym, :numericality => true, :inclusion => { :in => 1..31 }, :allow_nil => true
          validate "#{name}_date_values".to_sym
        end
      
        names.each do |name|
          define_method "#{name}_date" do
            year = send "#{name}_year"
            month = send "#{name}_month"
            day = send "#{name}_day"
            Date.new(year, month, day) if year && month && day && Date.valid_date?(year, month, day)
          end
        end
            
        names.each do |name|
          define_method "#{name}_date_values" do
            year = send "#{name}_year"
            month = send "#{name}_month"
            day = send "#{name}_day"
          
            if year && month && day
              errors.add(:base, "#{day}/#{month}/#{year} is not a valid #{name} date" ) unless Date.valid_date?(year.to_i, month.to_i, day.to_i)
            end
          end
        end
        
      end
    end
    
  end
end
