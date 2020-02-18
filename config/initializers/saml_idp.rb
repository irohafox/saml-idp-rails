SamlIdp.configure do |config|
  base = 'http://localhost:3456'

  # config.x509_certificate = <<-CERT
  #   -----BEGIN CERTIFICATE-----
  #   MIICRDCCAa0CFB2tz7zx7eJ9Gbid5CQN1CmdDiUKMA0GCSqGSIb3DQEBCwUAMGEx
  #   CzAJBgNVBAYTAkpQMQ4wDAYDVQQIDAVUb2t5bzERMA8GA1UEBwwIU2V0YWdheWEx
  #   DzANBgNVBAoMBmdyYWJzczELMAkGA1UECwwCc3MxETAPBgNVBAMMCGlyb2hhZm94
  #   MB4XDTIwMDIxNzA4MjcwMVoXDTIxMDIxNjA4MjcwMVowYTELMAkGA1UEBhMCSlAx
  #   DjAMBgNVBAgMBVRva3lvMREwDwYDVQQHDAhTZXRhZ2F5YTEPMA0GA1UECgwGZ3Jh
  #   YnNzMQswCQYDVQQLDAJzczERMA8GA1UEAwwIaXJvaGFmb3gwgZ8wDQYJKoZIhvcN
  #   AQEBBQADgY0AMIGJAoGBALodohMLLV+oLphaMjUtoWT8+Ox88oRt0AtmLe8KkKSe
  #   Y6z2q+QZA19mPVLWaIYkgoQkFZQGy+kFv+uYFtFqZsg5XXzgnn3KFfEumgPK+MZg
  #   sAAhmxmH8oVGq3SVh/zJadoPVGTuMc0LbNCBQg7tY3GCC+CxxcTC59a94X98TbUz
  #   AgMBAAEwDQYJKoZIhvcNAQELBQADgYEAZcCsdyYrzMcqmWfTsBLB9vCu7ZYpBav6
  #   btmmdv5oW7T/PtoaDbuTptLqlkt8lrXQHRgv2/uUY5pR1lJGeRF57w3N3HV/fXXe
  #   RfmDCOteR4R9LMnY21UkgxOZj1WZvCqOlz8RxOzRak98qayoAyGVH7hyjoafteiz
  #   dbeSg0OO9Oo=
  #   -----END CERTIFICATE-----
  # CERT

  # config.secret_key = <<-CERT
  #   -----BEGIN RSA PRIVATE KEY-----
  #   MIICWwIBAAKBgQC6HaITCy1fqC6YWjI1LaFk/PjsfPKEbdALZi3vCpCknmOs9qvk
  #   GQNfZj1S1miGJIKEJBWUBsvpBb/rmBbRambIOV184J59yhXxLpoDyvjGYLAAIZsZ
  #   h/KFRqt0lYf8yWnaD1Rk7jHNC2zQgUIO7WNxggvgscXEwufWveF/fE21MwIDAQAB
  #   AoGAL2FT3V0/E9cQ5aAwn/EZ4Ue1Zx737la2W/CLSQt7fy0DWwkBAXSMs0Cn4+rJ
  #   eTzaLSGyjJieWJgqH6P8Sxu3RlnqhMldVD+bZQbKWKcV6/rJ91zoFAt/mYbqVMCX
  #   GAZAFHpUvMFVsUNEtn482mo3EBuJ4zu3HLbJZ/SjjW37uwECQQDzM5RBEaSCGnME
  #   A71zWkffZnL6GTzzeWc1fmUj31hkNOlhJBO4JIOat0xihUnJpVWEeC9OCveMg5Oe
  #   RfWsWaUhAkEAw+j+G1A+599vKDP1bS8cWodyaV9ah8YRQyNt6x/i+njXeqzsxJdX
  #   6QmTDPLFZkBvylvMTyH35rFethwHPdw70wJASdbtOlxa8E2LgjqIeM9+Zuu6GQk0
  #   ok/H8Evx9VRIiBQwj5fejNg5RO5GONtzLdAPCOtcoXte8cC5PyLKlouZQQJAOZhO
  #   1DLUO5DpefVEivPVrxuw3B+nWtE1E/rffsdiEGbkWnFqLiWcN6uT6rOYqwX4l5JD
  #   T2RaIB03DezRiDMt9wJAHFLXE0HVd70gR23+OP/mUISP/GLPsKpOF7DM1ciFTIe6
  #   jNzwA2HnRDhdzI4KiKgRzBnOOUZcULZOTvjSgiH/Rw==
  #   -----END RSA PRIVATE KEY-----
  # CERT

  # config.password = 'secret_key_password'
  # config.algorithm = :sha256
  # config.organization_name = 'Your Organization'
  # config.organization_url = 'http://example.com'
  # config.base_saml_location = '#{base}/saml'
  # config.reference_id_generator                                 # Default: -> { UUID.generate }
  # config.single_logout_service_post_location = '#{base}/saml/logout'
  # config.single_logout_service_redirect_location = '#{base}/saml/logout'
  # config.attribute_service_location = '#{base}/saml/attributes'
  # config.single_service_post_location = '#{base}/saml/auth'
  # config.session_expiry = 86400                                 # Default: 0 which means never

  # Principal (e.g. User) is passed in when you `encode_response`
  #
  config.name_id.formats =
    {                         # All 2.0
      email: -> (principal) { principal.email },
      transient: -> (principal) { principal.id },
      persistent: -> (p) { p.id },
    }
  #   OR
  #
  #   {
  #     '1.1' => {
  #       email_address: -> (principal) { principal.email_address },
  #     },
  #     '2.0' => {
  #       transient: -> (principal) { principal.email_address },
  #       persistent: -> (p) { p.id },
  #     },
  #   }

  # If Principal responds to a method called `asserted_attributes`
  # the return value of that method will be used in lieu of the
  # attributes defined here in the global space. This allows for
  # per-user attribute definitions.
  #
  ## EXAMPLE **
  # class User
  #   def asserted_attributes
  #     {
  #       phone: { getter: :phone },
  #       email: {
  #         getter: :email,
  #         name_format: Saml::XML::Namespaces::Formats::NameId::EMAIL_ADDRESS,
  #         name_id_format: Saml::XML::Namespaces::Formats::NameId::EMAIL_ADDRESS
  #       }
  #     }
  #   end
  # end
  #
  # If you have a method called `asserted_attributes` in your Principal class,
  # there is no need to define it here in the config.

  # config.attributes # =>
  #   {
  #     <friendly_name> => {                                                  # required (ex 'eduPersonAffiliation')
  #       'name' => <attrname>                                                # required (ex 'urn:oid:1.3.6.1.4.1.5923.1.1.1.1')
  #       'name_format' => 'urn:oasis:names:tc:SAML:2.0:attrname-format:uri', # not required
  #       'getter' => ->(principal) {                                         # not required
  #         principal.get_eduPersonAffiliation                                # If no 'getter' defined, will try
  #       }                                                                   # `principal.eduPersonAffiliation`, or no values will
  #    }                                                                      # be output
  #
  ## EXAMPLE ##
  # config.attributes = {
  #   GivenName: {
  #     getter: :first_name,
  #   },
  #   SurName: {
  #     getter: :last_name,
  #   },
  # }
  ## EXAMPLE ##

  # config.technical_contact.company = 'Example'
  # config.technical_contact.given_name = 'Jonny'
  # config.technical_contact.sur_name = 'Support'
  # config.technical_contact.telephone = '55555555555'
  # config.technical_contact.email_address = 'example@example.com'

  service_providers = {
    'localhost:3000' => {
      fingerprint: '9E:65:2E:03:06:8D:80:F2:86:C7:6C:77:A1:D9:14:97:0A:4D:F4:4D',
      metadata_url: 'http://localhost:3000/users/saml/metadata',

      # We now validate AssertionConsumerServiceURL will match the MetadataURL set above.
      # *If* it's not going to match your Metadata URL's Host, then set this so we can validate the host using this list
      # response_hosts: ['192.168.11.6:3000']
    },
  }

  # `identifier` is the entity_id or issuer of the Service Provider,
  # settings is an IncomingMetadata object which has a to_h method that needs to be persisted
  config.service_provider.metadata_persister = ->(identifier, settings) {
    fname = identifier.to_s.gsub(/\/|:/,"_")
    FileUtils.mkdir_p(Rails.root.join('cache', 'saml', 'metadata').to_s)
    File.open Rails.root.join("cache/saml/metadata/#{fname}"), 'r+b' do |f|
      Marshal.dump settings.to_h, f
    end
  }

  # `identifier` is the entity_id or issuer of the Service Provider,
  # `service_provider` is a ServiceProvider object. Based on the `identifier` or the
  # `service_provider` you should return the settings.to_h from above
  config.service_provider.persisted_metadata_getter = ->(identifier, service_provider){
    fname = identifier.to_s.gsub(/\/|:/,"_")
    FileUtils.mkdir_p(Rails.root.join('cache', 'saml', 'metadata').to_s)
    full_filename = Rails.root.join("cache/saml/metadata/#{fname}")
    if File.file?(full_filename)
      File.open full_filename, 'rb' do |f|
        Marshal.load f
      end
    end
  }

  # Find ServiceProvider metadata_url and fingerprint based on our settings
  config.service_provider.finder = ->(issuer_or_entity_id) do
    service_providers[issuer_or_entity_id]
  end
end
