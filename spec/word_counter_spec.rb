require_relative "../lib/word_counter"
require_relative "../lib/config"
FILENAME = "../lib/shakespeare.txt"

describe "the file_to_list method" do

  it "should return an array" do
    expect(file_to_list("../lib/swearWords.txt")).to be_an_instance_of(Array)
  end

  it "should return a flat array of strings" do
    expect(file_to_list("../lib/swearWords.txt").any?(Array)).to be false
    expect(file_to_list("../lib/swearWords.txt").all?(String)).to be true
  end
end

describe "the init_dict method" do

  it "should return a hash" do
    expect(init_dict(DICTIONNARY).class).to eq(Hash)
  end

  it "should make a hash with all values = 0" do
    expect(init_dict(DICTIONNARY).values.all? {|v| v == 0}).to be true
  end
end
  
describe "the word_counter method" do
  
  it "should return a hash" do
    expect(word_counter("string", init_dict(DICTIONNARY)).class).to eq(Hash)
  end

  it "should return a hash with correct values" do
    expect(word_counter("de de i le la les i i i", init_dict(["de", "i", "le", "les"]))).to eq({"de" =>2, "i" =>4, "le" =>1, "les" =>1})
  end

  it "should ignore case" do
    expect(word_counter("De de i le la Les i I I", init_dict(["de", "i", "le", "les"]))).to eq({"de" =>2, "i" =>4, "le" =>1, "les" =>1})
  end

  it "should ignore punctuation" do
    expect(word_counter("De de... i le. la: Les, i I I !", init_dict(["de", "i", "le", "les"]))).to eq({"de" =>2, "i" =>4, "le" =>1, "les" =>1})
  end
end

describe "the word_counter_file method" do

  it "should return a hash with the correct values" do
    expect(word_counter_file("../lib/fichier_test.txt", init_dict(["je", "texte", "un", "le", "lignes", "gateau"]))).to eq({"je" =>2, "texte" =>2, "un" =>2, "le" => 2, "lignes" =>2, "gateau" =>1})
  end
end


    
