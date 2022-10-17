class CreateAppointment < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, foreign_key: { to_table: 'users' }
      t.references :patient, foreign_key: { to_table: 'users' }

      t.text :recommendation
      t.timestamps
    end
  end
end
