module CardInstancesHelper
    def card_instances_tree_for(card_instances)
        card_instances.map do |card_instance, nested_card_instances|
            render(card_instance) +
                (nested_card_instances.size > 0 ? content_tag(:div, card_instances_tree_for(nested_card_instances), class: "child"): nil)
        end.join.html_safe
    end

    def edit_card_instances_tree_for(card_instances)
        card_instances.map do |card_instance, nested_card_instances|

                content_tag(:li, render(partial: "/card_instances/edit", locals: {card_instance: card_instance} ) , class: "child") +

                (nested_card_instances.size > 0 ? content_tag(:ol, edit_card_instances_tree_for(nested_card_instances) , class: "child") : nil)

            #render(partial: "/card_instances/edit", locals: {card_instance: card_instance} ) +
              #  content_tag(:ol, nested_card_instances.size > 0 ? edit_card_instances_tree_for(nested_card_instances) : nil , class: "child")
        end.join.html_safe
    end
end
