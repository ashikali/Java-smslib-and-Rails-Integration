class CreateOutgoingSmsNumberGroups < ActiveRecord::Migration
  def self.up
    create_table :outgoing_sms_number_groups do |t|
      t.string :group_name
      t.text :phone_numbers

      t.timestamps
    end
  end

  def self.down
    drop_table :outgoing_sms_number_groups
  end
end
