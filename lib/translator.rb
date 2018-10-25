# require modules here
require "yaml"
require "pry"



def load_library(file_path)
  
  get_meaning = {}
  emoticons = YAML.load_file('./lib/emoticons.yml')
  hash = {'get_meaning' => {}, 'get_emoticon' => {}}
  emoticons.each do |description, array|
    hash['get_meaning'][array[1]] = description
    hash['get_emoticon'][array[0]] = array[1]
  end
  hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)
  j_emoticon = nil
  emoticons["get_emoticon"].each do |english, japanese|
    if emoticon == english
      j_emoticon = japanese
    end
  end
  if j_emoticon == nil
    "Sorry, that emoticon was not found"
  else 
    j_emoticon
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)
  meaning = nil
  emoticons["get_meaning"].each do |japanese, description|
    if emoticon == japanese
      meaning = description
    end
  end
  if meaning == nil
    "Sorry, that emoticon was not found"
  else
    meaning
  end
end

