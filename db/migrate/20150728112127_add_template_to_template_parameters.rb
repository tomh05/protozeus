class AddTemplateToTemplateParameters < ActiveRecord::Migration
  def change
    add_reference :template_parameters, :template, index: true, foreign_key: true
  end
end
