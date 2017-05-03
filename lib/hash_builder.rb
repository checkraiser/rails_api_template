##
# Support immutable Hash building
module HashBuilder
  def self.build(hash = {})
    Hamster::Hash[hash]
  end
end
