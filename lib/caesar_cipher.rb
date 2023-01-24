def caesar_cipher_char(char, key)
  char.match?(/[A-Z]/) ? (((char.ord + key - 'A'.ord) % 26) + 'A'.ord).chr : (((char.ord + key - 'a'.ord) % 26) + 'a'.ord).chr
end

def caesar_cipher(st, key)
  if st.class != String then return "Erreur : le message n'est pas une chaîne" end
  if key.class != Integer then return "Erreur : la clé n'est pas un nombre entier" end
  st.chars.map {|char| char.match?(/[a-zA-Z]/) ? caesar_cipher_char(char, key) : char}.join('')
end
