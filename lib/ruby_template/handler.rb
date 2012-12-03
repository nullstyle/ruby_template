require 'action_view'
require 'active_support/core_ext/class/attribute'

module RubyTemplate
  class Handler
    class_attribute :default_format
    self.default_format = Mime::JSON

    def call(template)    
      unless File.basename(template.virtual_path).start_with?('_')
        src = 'ActiveSupport::JSON.encode(code.call)'
      else
        src = "code.call"
      end

      "code = lambda{#{template.source}};" + "self.output_buffer = (#{src})"
    end
  end
end

ActionView::Template.register_template_handler :rb, RubyTemplate::Handler.new