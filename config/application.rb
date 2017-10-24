require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Demo
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    # 设置时间区域为北京
    config.time_zone = 'Beijing'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # 如果你想要新增目录到Rails设定的自动加载目录，可以编辑config/application.rb加上

    # 档名使用小写、单数，用底线区隔。例如当 Rails 看到一个 OrderItem 的类别或模组(Module)，
    # 它会在Rails设定的自动加载目录(包括app/models和app/models/concerns等等)中去加载叫做 order_item.rb 的档案，
    # 也就是自动 require “order_item”。
    # 如果是有嵌套的类别或模组，例如 Admin::OrderItem，则会多一层目录，
    # 例如加载app/models/admin/order_item.rb 的档案，也就是自动 require “admin/order_item”。
    # eager_load_paths 目录是指 Rails 会自动根据命名惯例加载，
    # 而 Ruby 的 $LOAD_PATH 常数则是 require 时会寻找的目录。
    # 像 lib 这个目录 Rails 默认就只有加到 $LOAD_PATH 之中，
    # 所以你放在 lib 的档案是可以 require 到，但是因为默认没有加到 eager_load_paths 之中，
    # 所以没有自动加载的机制。
    # config.eager_load_paths += %W( #{config.root}/lib )
  end
end
