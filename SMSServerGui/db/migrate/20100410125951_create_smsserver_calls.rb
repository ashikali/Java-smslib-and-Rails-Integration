class CreateSmsserverCalls < ActiveRecord::Migration
  def self.up
    create_table :smsserver_calls do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :smsserver_calls
  end
end
