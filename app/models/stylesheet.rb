class Stylesheet
  include ActiveModel::Model
  attr_accessor :text_color, :link_color, :font_family

  validate :at_least_one_property

  private
  def at_least_one_property
    if (text_color.blank? && link_color.blank? && font_family.blank?)
          errors.add(:base, "Please add atleast one property")
    end
  end

end
