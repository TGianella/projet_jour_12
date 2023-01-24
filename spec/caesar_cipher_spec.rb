require_relative "../lib/caesar_cipher"

describe "the caesar_cipher_char method" do

  it "should be displaying the n-th character after the one given as input" do
    expect(caesar_cipher_char('a', 10)).to eq('k')
  end

  it "should go back from a when it overflows from z" do
    expect(caesar_cipher_char('z', 1)).to eq('a')
  end

  it "should keep case" do
    expect(caesar_cipher_char('A', 1)).to eq('B')
  end

  it "should accept a negative key" do
    expect(caesar_cipher_char('g', -4)).to eq('c')
  end
end

describe "the caesar_cipher method" do

  it "should only change letters" do
    expect(caesar_cipher("Ceci est un exemple.", 4)).to eq('Gigm iwx yr ibiqtpi.')
  end

  it "should only accept an integer as a key" do
    expect(caesar_cipher("Exemple", "chiffre")).to eq("Erreur : la clé n'est pas un nombre entier")
    expect(caesar_cipher("Exemple", "1.3")).to eq("Erreur : la clé n'est pas un nombre entier")
  end

  it "should only accept a string as first argument" do
    expect(caesar_cipher(1, 1)).to eq("Erreur : le message n'est pas une chaîne")
    expect(caesar_cipher(1.1, 1)).to eq("Erreur : le message n'est pas une chaîne")
    expect(caesar_cipher([], 1)).to eq("Erreur : le message n'est pas une chaîne")
  end
end
    

