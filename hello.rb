require 'sinatra'
require 'mongo'

set :bind, '0.0.0.0'

get '/' do

   client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'test') 
 
   collection = client[:people]

   docs = [ { _id: 1, name: 'Steve', hobbies: [ 'hiking', 'tennis', 'fly fishing' ] },

           { _id: 2, name: 'Sally', hobbies: ['skiing', 'stamp collecting' ] } ]
  
   result = collection.insert_many(docs)

   file = Mongo::Grid::File.new('I am a file', :filename => 'new-file.txt')

   client.database.fs(:fs_name => 'grid').insert_one(file)

   collection.find( { name: 'Sally' } ).first

end
