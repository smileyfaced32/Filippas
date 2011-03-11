module ApplicationHelper
  
  def remove_child_link(name, f)
     f.hidden_field(:_destroy) + link_to_function(name, "if (confirm('Really?')) remove_fields(this)")
   end

   def add_child_link(name, f, method)
     fields = new_child_fields(f, method)
     link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"))
   end

   def new_child_fields(form_builder, method, options = {})
     options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
     options[:partial] ||= method.to_s.singularize
     options[:form_builder_local] ||= :f
     form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
       render(:partial => options[:partial], :locals => { options[:form_builder_local] => f })
     end
   end
 
  # Return a title on a per-page basis.
  def title
    base_title = "Filippas"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
  
  
end
