$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'yajl'
require 'coffee-script'
require 'sinatra/base'
require 'haml'
require 'sass'
require 'httparty'
require 'app/app'
require 'app/api/searchable'
require 'app/api/reddit'
require 'app/api/twitter'