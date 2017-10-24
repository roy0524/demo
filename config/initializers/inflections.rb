# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end

# Rails 的命名惯例十分倚赖英文的单复数，例如将单数的类别名称 Person 转成复数的表格名称 people。
# Inflector 就是负责将字串转换成单复数的类别，虽然它内建了一些基本的转换规格，
# 但是英文常常有例外的时候，你可以在这个档案中加上新的规格来做修正。
# 如果你不太确定 Rails 转换的对不对，请进入 console 主控台试试看：
#
# $ rails c
# $ Loading development environment (Rails 3.2.8)
# $ > "Business".singularize  => "Busines" # 转单数
# $ > "moose".pluralize => "mooses"  # 转复数
# 很不幸地这两个例子 Rails 都没转对，这时候你就可以利用 inflections.rb 来修正。
