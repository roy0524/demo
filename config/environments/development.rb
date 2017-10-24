Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.

  # 使用 Rails 开发可以快速的原因之一，就是当你修改一个小东西，只要重新整理浏览器就可以马上看到修改后的结果。
  # 这个秘诀就在于 cache_classes = false 会让每一次的 HTTP 请求都重新加载类别档案。
  # 更仔细的说，当这个值是 false 的时候，Rails 会改用 Ruby 的 load 方法，每次执行都会重新加载一次。
  # 相反地，如果这个值是 true，则会用 Ruby 的 require 方法，只会在第一次碰到的时候加载，之后碰到 require 相同的档案，
  # 就会自动忽略，也就是说如果你启动 Rails 后，档案有修改想看到结果，必须重新启动 Rails 才行，否则无法立即看到结果。
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  # Rails只有在连线是来自本地端的时候，才会将发生错误时的Call stack trace资讯给浏览器显示。
  # 这个设定将所有连线都当做本地端连线，好让开发模式时所有人连线都可以看到错误讯息。
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  # 是否启用 Controller 层级的快取(我们会在 Controller 一章介绍到有哪些快取方法)，
  # 一般来说在开发模式不会启用，除非你要测试它。
  config.action_mailer.raise_delivery_errors = false

  # 建议可以在开发模式设定 config.action_mailer.perform_deliveries = false，这样就不会真的寄信出去。
  # 如果寄信失败，是否要丢出例外。建议可以改成 true。
  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  # 随着 Rails 版本的升级，如果有方法会在之后的版本中移除，deprecation 会提示你如何因应。
  # 这里的 :log 表示会记录到 log 档案中。
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
