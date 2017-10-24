Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single test. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure public file server for tests with Cache-Control for performance.
  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.seconds.to_i}"
  }

  # 不同于 development 或 production 碰到例外会捕捉例外后，
  # 给浏览器显示出 call stack trace 或 public/500.html 画面，
  # 在 test 模式就不处理，让例外直接爆出。
  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment.
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.perform_caching = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  # 测试模式下不会真的去寄送email
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr.
  # 让 deprecation 讯息会直接显示到视窗之中。
  config.active_support.deprecation = :stderr

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
