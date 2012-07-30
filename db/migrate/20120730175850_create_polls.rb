class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :name
      t.string :public_link
      t.string :admin_link

      t.timestamps
    end
  end
end
