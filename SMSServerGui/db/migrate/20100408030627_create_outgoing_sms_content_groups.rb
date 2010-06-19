class CreateOutgoingSmsContentGroups < ActiveRecord::Migration
  def self.up
    create_table :outgoing_sms_content_groups do |t|
      t.string :group_name
      t.text :sms_content

      t.timestamps
    end
  end

  def self.down
    drop_table :outgoing_sms_content_groups
  end
end
