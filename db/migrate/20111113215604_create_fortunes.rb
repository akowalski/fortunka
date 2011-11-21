class CreateFortunes < ActiveRecord::Migration
  def change
    create_table :fortunes do |t|
      t.string :source
      t.text :quotation

      t.timestamps
    end
  end
end
