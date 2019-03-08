 module BlocRecord
   def self.connect_to(filename, type)
     @database_filename = filename
     @database_type = type
   end
 
   def self.database_filename
     @database_filename
   end
 end