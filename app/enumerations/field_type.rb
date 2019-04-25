class FieldType < EnumerateIt::Base
  associate_values(
    :car_plate_field,
    :cellphone_field,
    :checkbox_field,
    :cnpj_field,
    :cpf_field,
    :date_field,
    :datetime_field,
    :decimal_field,
    :email_field,
    :file_field,
    :hexacolor_field,
    :integer_field,
    :logo_field,
    :longtext_field,
    :phone_field,
    :radio_field,
    :select_field,
    :text_field,
    :time_field,
    :zipcode_field
  )
  sort_by :translation
end
