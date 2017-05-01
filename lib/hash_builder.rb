module HashBuilder
  def self.build(hash = {})
    Hamster::Hash[hash].to_h
  end
end
