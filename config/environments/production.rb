Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  # config.cache_classes = true 表示在 production 中，类别档案加载进内存中就快取起来了，大大获得效能。
  # 不像在 development 环境中每一次 HTTP 请求就会重新加载一次。
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  # 不同于 development，如果在 production 环境出现例外错误，不会显示程式 call stack 讯息，
  # 而是回传 public/500.html 页面。
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Attempt to read encrypted secrets from `config/secrets.yml.enc`.
  # Requires an encryption key in `ENV["RAILS_MASTER_KEY"]` or
  # `config/secrets.yml.key`.
  config.read_encrypted_secrets = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # `config.assets.precompile` and `config.assets.version` have moved to config/initializers/assets.rb

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # 默认的静态档案位置是目前主机的 public 目录，你可以透过修改 asset_host 变更位置。
  # 例如你的静态档案放在不同台机器或 CDN(Content delivery network) 上。
  # config.action_controller.asset_host = 'http://assets.example.com'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = 'X-Sendfile' # for Apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for NGINX

  # Mount Action Cable outside main process or domain
  # config.action_cable.mount_path = nil
  # config.action_cable.url = 'wss://example.com/cable'
  # config.action_cable.allowed_request_origins = [ 'http://example.com', /http:\/\/example.*/ ]

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # 是否限制全站必须SSL才能使用。
  # config.force_ssl = true

  # Use the lowest log level to ensure availability of diagnostic information
  # when problems arise.
  # 我们在 RESTful 应用程式 一章最后介绍了 Logger。这里可以设定 Logger 的层级。
  # 默认 production 是 :info，其他则是 :debug
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  # Use a different cache store in production.
  # 设定不同的快取储存库，默认是 :memory_store，也就是每个 Rails process 各自用内存存放。
  # 业界最常用的则是 memcached 内存快取服务器。
  # config.cache_store = :mem_cache_store

  # Use a real queuing backend for Active Job (and separate queues per environment)
  # config.active_job.queue_adapter     = :resque
  # config.active_job.queue_name_prefix = "demo_#{Rails.env}"
  config.action_mailer.perform_caching = false

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  # 如果 I18n 翻译档找不到，则找用默认语系的文字。我们会在I18n一章详细介绍多国语系功能。
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  # 将 deprecation 讯息传到 Notifications 频道，你可以用以下程式去订阅这个讯息：
  #   ActiveSupport::Notifications.subscribe("deprecation.rails") do |message, callstack|
  #   # deprecation message
  #   end
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Use a different logger for distributed setups.
  # 可以更换掉 Rails 内建的 Logger，例如换成使用 syslog 的 SyslogLogger。
  # require 'syslog/logger'
  # config.logger = ActiveSupport::TaggedLogging.new(Syslog::Logger.new 'app-name')

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false
end
