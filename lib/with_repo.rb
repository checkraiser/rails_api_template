module WithRepo
  extend ActiveSupport::Concern

  class_methods do
    def use_repo(repo)
      self.new.tap do |tmp|
        tmp.use_repo(repo)
      end
    end
  end

  def use_repo(repo)
    @_repo = repo
    self
  end
  
  private
  
  def repo
    @_repo
  end
end
