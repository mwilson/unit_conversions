class CreateUnitConversionsTable < ActiveRecord::Migration
  def self.up
    create_table :unit_conversions do |t|
      t.string :units_in
      t.string :units_out
      t.float :conversion_factor

      t.timestamps
    end

    units = File.open("#{::Rails.root.to_s}/tmp/units.csv")
    units.each { |line|
      x = line.split
      puts "  Adding conversions for in:#{x[0]} out:#{x[1]}"
      UnitConversion.create :units_in => x[0], :units_out=> x[1], :conversion_factor=> x[2]
    }
  end


  def self.down
    drop_table :unit_conversions
  end
end