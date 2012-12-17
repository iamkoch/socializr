$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'rubygems'
require 'sinatra'
require 'yajl'
require 'coffee-script'
require 'sinatra/base'
require 'haml'
require 'sass'
require 'httparty'
require 'app'
require 'api/searchable'
require 'api/reddit'
require 'api/twitter'