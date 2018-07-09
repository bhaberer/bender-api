require 'json'

def json_file_to_hash(file_name)
  file = File.read(file_name)
  JSON.parse(file)
end
