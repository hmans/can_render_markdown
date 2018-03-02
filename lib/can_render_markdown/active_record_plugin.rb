module CanRenderMarkdown
  module ActiveRecordPlugin
    def self.included(klass)
      klass.extend ClassMethods
    end

    module ClassMethods
      def render_markdown(field_name, to: nil)
        before_save do
          to ||= "#{field_name}_html"
          changed_name = "#{field_name}_changed?"

          if send(changed_name)
            field_value = send(field_name)
            send("#{to}=", CanRenderMarkdown.formatify(field_value))
          end
        end
      end
    end
  end
end

if defined?(ActiveRecord)
  ActiveRecord::Base.send(:include, CanRenderMarkdown::ActiveRecordPlugin)
end
