# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'bcrypt'
require 'rack-flash'
require 'pry-debugger'

require 'carrierwave'
require 'carrierwave/processing/mini_magick'
require 'dotenv'
require 'mini_magick'
require 'fog'

Dotenv.load
ENV['RACK_ENV'] ||= 'development'

enable :sessions
use Rack::Flash, :sweep => true

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do
  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

#set up carrierwave
require 'carrierwave/orm/activerecord'
# Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }
# CarrierWave.configure do |config|
#     config.root = APP_ROOT + 'public/'
# end
# CarrierWave.configure do |config|
#     config.root = APP_ROOT + 'public/'
#     config.fog_credentials = {
#         provider:                'AWS',
#         aws_access_key_id:      ENV['AWS_S3_KEY_ID'],
#         aws_secret_access_key:  ENV['AWS_SECRET_ACCESS_KEY'],
#         region:                 ENV['AWS_S3_REGION'],
#       }
#       config.fog_directory  = 'jiveturkey',
#       #config.fog_public     = false
# end