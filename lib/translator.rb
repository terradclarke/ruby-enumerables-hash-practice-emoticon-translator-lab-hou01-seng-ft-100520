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

def get_japanese_emoticon(file_path, eng_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
      return idioms[:japanese] if idioms[:english] == eng_emo
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, jap_emo)
  library = load_library('./lib/emoticons.yml')
  library.each do |meaning, idioms|
    return meaning if idioms[:japanese] == jap_emo
  end
    "Sorry, that emoticon was not found"
 end 

