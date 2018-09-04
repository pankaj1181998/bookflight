class CreateIataCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :iata_codes do |t|
      t.string :city
      t.string :airport
      t.string :code

      t.timestamps
    end
  end
end
