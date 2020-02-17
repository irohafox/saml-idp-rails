class SamlIdpController < SamlIdp::IdpController
  def new
    super
  end

  def show
    super
  end

  def create
    super
  end

  def logout
    super
  end

  # 以下は公式サンプル(https://github.com/saml-idp/saml_idp)
  def idp_authenticate(email, password) # not using params intentionally
    user = User.by_email(email).first
    user && user.valid_password?(password) ? user : nil
  end
  private :idp_authenticate

  def idp_make_saml_response(found_user) # not using params intentionally
    # NOTE encryption is optional
    encode_response found_user, encryption: {
      cert: saml_request.service_provider.cert,
      block_encryption: 'aes256-cbc',
      key_transport: 'rsa-oaep-mgf1p'
    }
  end
  private :idp_make_saml_response

  def idp_logout
    user = User.by_email(saml_request.name_id)
    user.logout
  end
  private :idp_logout

  # これで判定しているのでログイン画面をデバッグしたい時は空でOverrride
  # def validate_saml_request
  # end
end
