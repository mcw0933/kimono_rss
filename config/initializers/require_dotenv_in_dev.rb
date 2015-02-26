# dotenv allows developers to store environment variables in a .env file
# We will use actual environment variables in test or production
require 'dotenv' if Rails.env.development?
