class AddValueToTemplateParameters < ActiveRecord::Migration
  def change
    add_column :template_parameters, :value, :string
  end
end
