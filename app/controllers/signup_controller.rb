class SignupController < ApplicationController
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash.now[:success] = "Thanks for signing up!"
        format.html { redirect_to thank_you_path }
        #format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email,:mobile_number,:company_name,:company_address)
  end

end
