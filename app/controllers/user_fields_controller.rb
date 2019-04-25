class UserFieldsController < ApplicationController
  def index
    @user_fields = UserField.all
  end

  def create
    @user_field = UserField.new(user_field_params)
    if @user_field.save
      flash[:notice] = "Deu Bom!"
      redirect_to user_fields_path
    else
      flash[:error] = "Deu Ruim!"
      render :new
    end
  end

  def new
    @user_field = UserField.new
  end

  def user_field_params
    params.require( :user_field ).permit(
      :name, :field_type, :required, :unique, :max_value, :min_value, :field_hint,
      collection_lists_attributes: [:id, :name, :user_field_id, :_destroy]
    )
  end
end
