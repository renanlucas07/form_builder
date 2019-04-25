class User < ApplicationRecord
  serialize :preferences

  UserField.all.each do |field|
    store_accessor :preferences, field.name
  end

  validate :custom_fields_validation

  def custom_fields_validation
    UserField.all.each do |field|
      if field.required? and (self.preferences["#{field}"].blank?)
        errors.add(field.name, "não pode ficar em branco")
      end
      if field.unique? and (self.unique_value(field, self.preferences["#{field}"]))
        errors.add(field.name, "já está em uso")
      end
      if field.max_value != nil and (self.preferences["#{field}"].to_f >= field.max_value)
        errors.add(field.name, "não pode ser maior que #{field.max_value}")
      end
      if field.min_value != nil and (self.preferences["#{field}"].to_f <= field.min_value)
        errors.add(field.name, "não pode ser menor que #{field.min_value}")
      end
      if ((field.cpf_field? and !CPF.valid?(self.preferences["#{field}"])) or (field.cnpj_field? and !CNPJ.valid?(self.preferences["#{field}"])))
        errors.add(field.name, "não é válido")
      end
    end
  end

  def unique_value(field, value)
    count = 0
    User.all.each do |user|
      count += 1 if user.preferences["#{field}"] == value
    end

    return true if count == 1
    false
  end

end
