class Poll < ActiveRecord::Base
  attr_accessible :admin_link, :name, :public_link
  
  before_validation :generate_admin_link
  before_validation :generate_public_link
  
  validates :name,        :presence   => true
  validates :admin_link,  :presence   => true,
                          :uniqueness => true
  validates :public_link, :presence   => true,
                          :uniqueness => true
  
  has_many :questions
  
  def to_param
    [id, public_link.parameterize].join("-") unless self.public_link.nil?
  end
  
  def self.find(input)
    input.to_i == 0 ? find_by_public_link(input) : super
  end
  
  private
  
    def generate_admin_link
      self.admin_link = generate_random_string if self.admin_link.nil?
    end
    
    def generate_public_link
      self.public_link = generate_random_string if self.public_link.nil?
    end
  
    def generate_random_string(max = 6)
      alphabet_characters = [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      (0..max).map{ alphabet_characters[rand(alphabet_characters.length)]  }.join
    end
end
