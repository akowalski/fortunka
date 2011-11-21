class Fortune < ActiveRecord::Base
has_many :comments, :dependent => :destroy
def self.search(search)
  if search
    where('quotation LIKE ?', "%#{search}%")
  else
    scoped
  end
end

end
