class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.text :about
      t.text :mission
      t.text :vision
      t.string :logo

      t.timestamps null: false
    end
  end
end
