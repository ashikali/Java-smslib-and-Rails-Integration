class CreateSmsserverInMessages < ActiveRecord::Migration
  def self.up
    create_table :smsserver_in_messages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :smsserver_in_messages
  end
end
