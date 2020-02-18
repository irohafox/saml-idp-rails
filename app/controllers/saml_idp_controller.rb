class SamlIdpController < SamlIdp::IdpController
  def new
    render :new
  end

  def show
    super
  end

  def create
    unless params[:email].blank? && params[:password].blank?
      user = idp_authenticate(params[:email], params[:password])
      if user.nil?
        @saml_idp_fail_msg = "Incorrect email or password."
      else
        @saml_response = idp_make_saml_response(user)
        render :saml_post, layout: false
        return
      end
    end
    render :new
  end

  def logout
    super
  end

  private

  def idp_authenticate(email, password)
    user = User.find_by(email: email)
    user && user.valid_password?(password) ? user : nil
  end

  def idp_make_saml_response(found_user) # not using params intentionally
    # NOTE encryption is optional
    encode_response found_user, encryption: {
      cert: saml_request.service_provider.cert,
      block_encryption: 'aes256-cbc',
      key_transport: 'rsa-oaep-mgf1p'
    }
  end

  def idp_logout
    user = User.by_email(saml_request.name_id)
    user.logout
  end
end
