require './lib/mystery_date'
require 'active_model'

class KlassWithoutPrefixedDateMethods
  include ActiveModel::Validations
  extend MysteryDate::ClassMethods
  
  has_mystery_date
    
  attr_accessor :year, :month, :day
  
  def initialize(year=nil,month=nil,day=nil)
    @year = year
    @month = month
    @day = day
  end
end

class KlassWithPrefixedDateMethods
  include ActiveModel::Validations
  extend MysteryDate::ClassMethods
  
  has_mystery_date :birth
  
  attr_accessor :birth_year, :birth_month, :birth_day
  
  def initialize(birth_year=nil,birth_month=nil,birth_day=nil)
    @birth_year = birth_year
    @birth_month = birth_month
    @birth_day = birth_day
  end
end