 module BlocRecord
   module Utility
 #   #1
     extend self
 
     def underscore(camel_cased_word)
 #      #2
        string = camel_cased_word.gsub(/::/, '/')
 #      #3
        string.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
 #      #4
        string.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
 #      #5
        string.tr!("-", "_")
 #      #6
        string.downcase
     end

     def camel_case(snake_case)
        words = snake_case.split("_").map {|x|  x.capitalize }
        words.join("")
     end
 
     def sql_strings(value)
       case value
       when String
         "'#{value}'"
       when Numeric
         value.to_s
       else
         "null"
       end
     end
 
     def convert_keys(options)
       options.keys.each {|k| options[k.to_s] = options.delete(k) if k.kind_of?(Symbol)}
       options
     end     
     def instance_variables_to_hash(obj)
       Hash[obj.instance_variables.map{ |var| ["#{var.to_s.delete('@')}", obj.instance_variable_get(var.to_s)]}]
     end
 
     def reload_obj(dirty_obj)
       persisted_obj = dirty_obj.class.find(dirty_obj.id)
       dirty_obj.instance_variables.each do |instance_variable|
         dirty_obj.instance_variable_set(instance_variable, persisted_obj.instance_variable_get(instance_variable))
       end
     end
   end
 end