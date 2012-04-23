class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.string   :name
    	t.string   :email
    	t.datetime :sent_at

      t.timestamps
    end
  end
end