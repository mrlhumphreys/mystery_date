require './lib/mystery_date'
require './spec/spec_helper.rb'

describe MysteryDate do
  context "given a class that hasn't got prefixed date methods" do
    context "if year month and day exists" do
      context "and they make a valid date" do
        subject { KlassWithoutPrefixedDateMethods.new(2010, 12, 17) }
        it { should be_valid }
      end

      context "and they make an invalid date" do
        subject { KlassWithoutPrefixedDateMethods.new(2010, 13, 17) }
        it { should_not be_valid }
      end
    end

    context "if year does not exist" do
      subject { KlassWithoutPrefixedDateMethods.new(nil,12,17) }
      it { should be_valid }
    end
    
    context "if the month does not exist" do
      subject { KlassWithoutPrefixedDateMethods.new(2010,nil,17) }
      it { should be_valid }
    end
    
    context "if the day does not exist" do
      subject { KlassWithoutPrefixedDateMethods.new(2010,12,nil) }
      it { should be_valid }
    end
    
    context "if year is not a number" do
      subject { KlassWithoutPrefixedDateMethods.new("Y2K",12,17) }
      it { should_not be_valid }
    end
    
    context "if the month is not a number" do
      subject { KlassWithoutPrefixedDateMethods.new(2010,"Advent",17) }
      it { should_not be_valid }
    end
    
    context "if the day is not a number" do
      subject { KlassWithoutPrefixedDateMethods.new(2010,12,"Valentine's Day") }
      it { should_not be_valid }
    end
    
    context "if the day is outside of the 31 day range" do
      subject { KlassWithoutPrefixedDateMethods.new(nil,nil,32) }
      it { should_not be_valid }
    end
    
    context "if the month is outside of the 12 month range" do
      subject { KlassWithoutPrefixedDateMethods.new(nil,13,nil) }
      it { should_not be_valid }
    end
  end
  
  context "given a class that has got prefixed date methods" do
    context "if year month and day exists" do
      context "and they make a valid date" do
        subject { KlassWithPrefixedDateMethods.new(2010, 12, 17) }
        it { should be_valid }
      end

      context "and they make an invalid date" do
        subject { KlassWithPrefixedDateMethods.new(2010, 13, 17) }
        it { should_not be_valid }
      end
    end

    context "if year does not exist" do
      subject { KlassWithPrefixedDateMethods.new(nil,12,17) }
      it { should be_valid }
    end
    
    context "if the month does not exist" do
      subject { KlassWithPrefixedDateMethods.new(2010,nil,17) }
      it { should be_valid }
    end
    
    context "if the day does not exist" do
      subject { KlassWithPrefixedDateMethods.new(2010,12,nil) }
      it { should be_valid }
    end
    
    context "if year is not a number" do
      subject { KlassWithPrefixedDateMethods.new("Y2K",12,17) }
      it { should_not be_valid }
    end
    
    context "if the month is not a number" do
      subject { KlassWithPrefixedDateMethods.new(2010,"Advent",17) }
      it { should_not be_valid }
    end
    
    context "if the day is not a number" do
      subject { KlassWithPrefixedDateMethods.new(2010,12,"Valentine's Day") }
      it { should_not be_valid }
    end
    
    context "if the day is outside of the 31 day range" do
      subject { KlassWithPrefixedDateMethods.new(nil,nil,32) }
      it { should_not be_valid }
    end
    
    context "if the month is outside of the 12 month range" do
      subject { KlassWithPrefixedDateMethods.new(nil,13,nil) }
      it { should_not be_valid }
    end
  end
end