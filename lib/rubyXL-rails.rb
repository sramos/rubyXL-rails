module RubyXL
  module Rails 
    def self.render_xlsx_string(spreadsheet)
<<RENDER
      workbook = RubyXL::Workbook.new
      #{spreadsheet}
      workbook.stream
RENDER
    end
  end
end

# Setups the template handling
require "action_view/template"
require 'rubyXL'
ActionView::Template.register_template_handler :rxlsx, lambda { |template, source|
  RubyXL::Rails.render_xlsx_string(source)
}

# Adds support for `format.xlsx`
require "action_controller"
Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx

ActionController::Renderers.add :xlsx do |filename, options|
  send_data(render_to_string(options), :filename => "#{filename}.xlsx", :type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :disposition => "attachment")
end
