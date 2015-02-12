class CreateGenereateUrls < ActiveRecord::Migration
  def change
    create_table :genereate_urls do |t|
      t.string :url_name

      t.timestamps
    end
  end
end
