Time.zone = "Madrid"

# Event collection as blog articles
activate :blog do |blog|
  blog.name   = "events"
  blog.prefix = "events"
  blog.layout = "events"
  blog.publish_future_dated = true
end

# Extensions
activate :directory_indexes
activate :automatic_image_sizes
activate :sprockets
activate :dotenv

# Special format rendering
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Build
configure :build do
  # Change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets
end

# Deploy
activate :s3_sync do |s3_sync|
  s3_sync.bucket                     = ENV['AWS_S3_BUCKET']
  s3_sync.region                     = ENV['AWS_S3_REGION']
  s3_sync.aws_access_key_id          = ENV['AWS_KEY_ID']
  s3_sync.aws_secret_access_key      = ENV['AWS_SECRET_KEY']
  s3_sync.delete                     = false
  s3_sync.after_build                = false
  s3_sync.prefer_gzip                = true
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = true
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
  s3_sync.prefix                     = ''
  s3_sync.version_bucket             = false
  s3_sync.index_document             = 'index.html'
  s3_sync.error_document             = '404.html'
end
