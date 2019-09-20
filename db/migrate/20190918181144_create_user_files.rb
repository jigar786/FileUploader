class CreateUserFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_files do |t|
      t.references :user, foreign_key: true
      t.string :file_name

      t.timestamps
    end
  end
end
