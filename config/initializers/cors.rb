Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # 'http://example.com:80'
    resource '/graphql',
      :headers => :any,
      :methods => [:post]
    resource '/forecasts',
      headers: :any,
      methods: [:get]
  end
end
