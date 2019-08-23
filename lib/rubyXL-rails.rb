module RubyXL
  module Rails 
    def self.render_xlsx_string(spreadsheet)
<<RENDER
      workbook = RubyXL::Parser.parse_buffer(spreadsheet)
      workbook.stream
RENDER
    end
  end
end

# Setups the template handling
require "action_view/template"
require 'rubyXL'
ActionView::Template.register_template_handler :rxlsx, lambda { |template|
  rubyXL::Rails.render_xlsx_string(template.source)
}

# Why doesn't the above template handler catch this one as well?
# Added for backwards compatibility.
ActionView::Template.register_template_handler :"xlsx.rxlsx", lambda { |template|
  rubyXL::Rails.render_xlsx_string(template.source)
}

# Adds support for `format.xlsx`
require "action_controller"
Mime::Type.register "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :xlsx

ActionController::Renderers.add :xlsx do |filename, options|
  send_data(render_to_string(options), :filename => "#{filename}.xlsx", :type => "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", :disposition => "attachment")
end
