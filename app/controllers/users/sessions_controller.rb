class Users::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
#  before_filter :validate_auth_token, :except => :create
  respond_to :html, :json
  # before_filter :configure_sign_in_params, only: [:create]

   # GET /resource/sign_in
#   def new
#     #super
#     respond_to do |format|
#       format.json { render json: "success", status: :ok}
#     end
#   end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
#  def destroy
#     super
#   respond_to do |format|
#     #format.html { redirect_to new_user_session_path }
#     format.json { render json: "success", status: :ok}
#   end
#  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
