require 'yaml'
require 'pry'

def load_library(path)

  emoticons = YAML.load_file("lib/emoticons.yml")
  frank_emoticons = {}
  emoticons.each do |name,arrays|
      frank_emoticons[name] ||= {}
      frank_emoticons[name][:english] = arrays[0]
      frank_emoticons[name][:japanese] = arrays[1]
  end
frank_emoticons
end


def get_japanese_emoticon(path, emoticon)
  frank_emoticons = load_library(path)
  result = frank_emoticons["get_emoticon"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

def get_english_meaning(path, emoticon)
  frank_emoticons = load_library(path)
  result = frank_emoticons["get_meaning"][emoticon]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result
end

