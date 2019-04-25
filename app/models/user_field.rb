class UserField < ApplicationRecord
  has_enumeration_for :field_type, create_helpers: true, create_scopes: true
  has_many :collection_lists, inverse_of: :user_field
  accepts_nested_attributes_for :collection_lists, reject_if: :all_blank, allow_destroy: true

  validates :name, :field_type, presence: true
  validates :name, uniqueness: true
  validates :collection_lists, presence: true, if: :as_radio

  after_create :set_field_name

  def input_type_selector
    case field_type
    when FieldType::INTEGER_FIELD
      :integer
    when FieldType::LONGTEXT_FIELD
      :text
    when FieldType::DECIMAL_FIELD
      :decimal
    when FieldType::CHECKBOX_FIELD
      :boolean
    when FieldType::RADIO_FIELD
      :radio_buttons
    when :default
      :string
    end
  end

  def as_radio
    return true if self.radio_field?
    false
  end

  def field_parameterize
    field_name.intern
  end

  def to_sym

  end

  def label
    name
  end

  def to_s
    field_name
  end

  def set_field_name
    x = UserField.find(id)
    x.field_name = name.gsub(/[^0-9A-Za-z]/, '').downcase
    x.save
  end

  def collection_list
    return collection_lists if self.select_field? or self.radio_field?
    nil
  end

end
