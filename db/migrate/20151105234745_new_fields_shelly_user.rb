class NewFieldsShellyUser < Mongoid::Migration
  def self.up
		add_column :shelly_user, :encrypted_password, :string
		add_column :shelly_user, :email, :string
		add_column :shelly_user, :activated, Mongoid::Boolean
		add_column :shelly_user, :username, :string
		add_column :shelly_user, :description, :string
		add_column :shelly_user, :first_name, :string
		add_column :shelly_user, :last_name, :string
  end

  def self.down
  end
end
