OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '317218595100808', '60a88fd905f7848a8d0f5b8c1432d6ae'
end