require 'yaml'
require 'pry'

def load_library(file_path)
 #code goes here
  emo = YAML.load_file("lib/emoticons.yml")
  frank_emo = {}
  emo.each do |name,arrays|
      frank_emo[name] ||= {}
      frank_emo[name][:english] = arrays[0]
      frank_emo[name][:japanese] = arrays[1]
  end
frank_emo
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  result = emoticon_hash["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end