# Be sure to restart your server when you modify this file.

# Configure sensitive parameters which will be filtered from the log file.
# 设定 filter_paramsters 可以避免任何叫做 password 的参数值记录到 log 中，有效防止使用者的原始密码外洩到 log 档案。
Rails.application.config.filter_parameters += [:password]
