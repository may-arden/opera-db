class CreateOperas < ActiveRecord::Migration[6.1]
  def change
    create_table :operas do |t|
      t.string :name

      t.timestamps
    end
  end
end
