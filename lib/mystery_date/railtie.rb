require 'mystery_date'
require 'rails'

module MysteryDate
  class Railtie < Rails::Railtie
    initializer 'mystery_date.initialize' do
      ActiveSupport.on_load :active_record do
        MysteryDate::Railtie.insert
      end
    end
    
    def insert
      ActiveRecord::Base.send :extend, MysteryDate::ClassMethods
    end
  end
end
