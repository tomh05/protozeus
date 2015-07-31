class AddAtomToTemplateParameters < ActiveRecord::Migration
  def change
    add_reference :template_parameters, :atom, index: true, foreign_key: true
  end
end
