class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body
      t.timestamps

      t.string :title, nul: false
      t.string :body, nul: false
    end
  end
end
