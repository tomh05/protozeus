class CreateAtoms < ActiveRecord::Migration
  def change
    create_table :atoms do |t|
      t.string :content
      t.string :body

      t.timestamps null: false
    end
  end
end
