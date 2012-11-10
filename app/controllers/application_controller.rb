class ApplicationController < ActionController::Base
  protect_from_forgery
  include TwitterHelper
  
  require 'nokogiri'
  require 'open-uri'
  
end
