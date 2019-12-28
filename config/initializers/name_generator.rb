$name_generator = RandomNameGenerator.new

def name_generator
  [
    Forgery::Basic.color,
    # gets 2 syllable fantasy name
    $name_generator.compose(2),
    # gets 4 random characters from 64 bit hash, joins them, and removes all "_" and "-"
    SecureRandom.urlsafe_base64.split('').sample(4).join.gsub(/(-|_)/, '')
    # joins all 3 together and downcases
  ].join('_').downcase
end
