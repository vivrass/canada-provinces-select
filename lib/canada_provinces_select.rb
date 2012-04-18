module ActionView
  module Helpers
    module FormOptionsHelper
      def canada_province_options_for_select(selected = nil, canada_province_options = {})
        province_options      = ""
        priority_provinces    = lambda { |province| canada_province_options[:priority].include?(province.last) }
        canada_province_options[:show] = :full if canada_province_options[:with_abbreviation]
        provinces_label = case canada_province_options[:show]
          when :full_abb          then lambda { |province| [province.first, province.last] }
          when :full              then lambda { |province| [province.first, province.first] }
          when :abbreviations     then lambda { |province| [province.last, province.last] }
          when :abb_full_abb      then lambda { |province| ["#{province.last} - #{province.first}", province.last] }
          else                         lambda { |province| province }
        end

        if canada_province_options[:include_blank]
          province_options += "<option value=\"\">--</option>\n"
        end

        if canada_province_options[:priority]
          province_options += options_for_select(CANADA_PROVINCES.select(&priority_provinces).collect(&provinces_label), selected)
          province_options += "<option value=\"\">--</option>\n"
        end

        if canada_province_options[:priority] && canada_province_options[:priority].include?(selected)
          province_options += options_for_select(CANADA_PROVINCES.reject(&priority_provinces).collect(&provinces_label), selected)
        else
          province_options += options_for_select(CANADA_PROVINCES.collect(&provinces_label), selected)
        end

        return province_options
      end

      def canada_province_select(object, method, canada_province_options = {}, options = {}, html_options = {})
        InstanceTag.new(object, method, self, options.delete(:object)).to_canada_province_select_tag(canada_province_options, options, html_options)
      end

      private
        CANADA_PROVINCES = [
          ["Alberta", "AB"],
          ["British Columbia", "BC"],
          ["Manitoba", "MB"],
          ["New Brunswick", "NB"],
          ["Newfoundland", "NL"],
          ["Northwest Territories", "NT"],
          ["Nova Scotia", "NS"],
          ["Nunavut", "NU"],
          ["Ontario", "ON"],
          ["Prince Edward Island", "PE"],
          ["Quebec", "QC"],
          ["Saskatchewan", "SK"],
          ["Yukon Territory", "YT"]
        ] unless const_defined?("CANADA_PROVINCES")

    end

    class InstanceTag #:nodoc:

      def to_canada_province_select_tag(canada_province_options, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        content_tag("select", add_options(canada_province_options_for_select(value(object), canada_province_options), options, value(object)), html_options)
      end
    end
    
    class FormBuilder
      def canada_province_select(method, canada_province_options = {}, options = {}, html_options = {})
        @template.canada_province_select(@object_name, method, canada_province_options, options.merge(:object => @object), html_options)
      end
    end
  end
end
