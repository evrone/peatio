# Load the rails application
require File.expand_path('../application', __FILE__)

# Load mysql2_adapter fix
require File.expand_path('../initializers/mysql2_adapter', __FILE__)

# Initialize the rails application
Peatio::Application.initialize!
