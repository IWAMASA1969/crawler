begin
  require 'mysql2'
rescue LoadError
  puts "You need the mysql2 gem to use Anemone::Storage::MySQ"
  exit
end

module Anemone
  module Storage
    class MySQL

      def initialize(opts = {})
        host = opts[:host] || 'localhost'
        username = opts[:username] || 'crawler'
        password = opts[:password] || 'anemone_pass'
        database = opts[:database] || 'anemone'
        @db = Mysql2::Client.new(
          :host => host,
          :username => username,
          :password => password,
          :database => database
        )
        create_schema
      end

      def [](url)
        key = get_hash_value(url)
        value = @db.query("SELECT page_data FROM anemone_storage WHERE page_key = '#{key}'").first['page_data']
        if value
          Marshal.load(value)
        end
      end

      def []=(url, value)
        key = get_hash_value(url)
        data = Marshal.dump(value)
        if has_key?(url)
          sql = "UPDATE anemone_storage SET page_data = ? WHERE page_key = ?"
        else
          sql = "INSERT INTO anemone_storage (page_data, page_key) VALUES(?, ?)"
        end
        stmt = @db.prepare(sql)
        stmt.execute(data, key)
      end

      def delete(url)
        page = self[url]
        key = get_hash_value(url)
        @db.query("DELETE FROM anemone_storage WHERE page_key =  '#{key}'")
        page
      end

      def each
        @db.query("SELECT page_key, page_data FROM anemone_storage ORDER BY id") do |row|
          value = Marshal.load(row[1])
          yield row[0], value
        end
      end

      def merge!(hash)
        hash.each { |key, value| self[key] = value }
        self
      end

      def size
        result =
          @db.query('SELECT COUNT(id) AS row_count FROM anemone_storage')

        return result.first['row_count']
      end

      def keys
        @db.query("SELECT page_key FROM anemone_storage ORDER BY id").map{|t| t[0]}
      end

      def has_key?(url)
        key = get_hash_value(url)
        result =
          @db.query("SELECT COUNT(id) AS row_count FROM anemone_storage WHERE page_key = '#{key}'")

        return (result.first['row_count'] > 0)
      end

      def close
        @db.close
      end

      private

      def create_schema
        @db.query <<SQL
CREATE TABLE IF NOT EXISTS anemone_storage (
  id int(11) NOT NULL auto_increment,
  page_key varchar(255),
  page_data BLOB,
  PRIMARY KEY (id),
  KEY (page_key)
) DEFAULT CHARSET=utf8;
SQL
      end

      def get_hash_value(key)
        Digest::SHA1.hexdigest(key)
      end
    end
  end
end
