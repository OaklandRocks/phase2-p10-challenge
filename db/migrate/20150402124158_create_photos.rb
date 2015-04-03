class CreatePhotos < ActiveRecord::Migration
  def change
    create_table  :photos do |t|
      t.integer   :album_id, null: false
      t.string    :path, null: false
      t.string    :file

      t.timestamps
    end
  end
end
