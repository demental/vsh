CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.staging?
    config.storage    = :aws
    config.aws_bucket = Settings.app.amazon.s3.api.bucket
    # config.aws_acl    = :public_read
    # config.asset_host = 'http://example.com'
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 365

    config.aws_credentials = {
      access_key_id:     Settings.app.amazon.s3.api.key,
      secret_access_key: Settings.app.amazon.s3.api.secret
    }
  else
    config.storage = :file
  end
end
