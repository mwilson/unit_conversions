class UnitConversion < ActiveRecord::Base
  default_scope :order=>:units_in

  def self.convert_units(units_in, units_out, result)
    uc = UnitConversion.find_by_units_in_and_units_out(units_in, units_out)
    return result * uc.conversion_factor
  rescue Exception
    return nil
  end

end