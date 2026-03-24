namespace :fts do
  desc "Rebuild FTS5 index for productos"
  task rebuild: :environment do
    ActiveRecord::Base.connection.execute("INSERT INTO productos_fts(productos_fts) VALUES('rebuild')")
    puts "FTS5 index rebuilt successfully"
  end
end
