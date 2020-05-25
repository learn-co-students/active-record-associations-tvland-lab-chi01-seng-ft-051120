class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    # using collect because we need it
    # to return an array
    self.characters.collect do |character|
      "#{character.name} - #{character.show.name}"
    end
  end
end