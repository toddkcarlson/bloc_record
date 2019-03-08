 require 'sqlite3'
 require 'pg'
 
 module Connection
  def connect
    if BlocRecord.database_type === :sqlite3
      SQLite3::Database.new(BlocRecord.database_filename)
    else BlocRecord.database_type === :pg
      PG::Connection.new(BlocRecord.database_filename)
    end
  end

  def connection
    @connection ||= self.connect()
  end
 end