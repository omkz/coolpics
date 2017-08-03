Swagger::Docs::Config.base_api_controller = ActionController::API

class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "apidocs/#{path}"
  end
end

Swagger::Docs::Config.register_apis({
  "1.0" => {
    # location where our api doc files will be generated, as of now we will store files under public directory
    :api_file_path => "public/apidocs",
    # base path url of our application
    # while using production mode, point it to production url
    :base_path => "http://localhost:3000",
    # setting this option true tells swagger to clean all files generated in api_file_path directory before any files are generated
    :clean_directory => true,
    # As we are using Rails-API, our ApplicationController inherits ActionController::API instead of ActionController::Base
    # Hence, we need to add ActionController::API instead of default ActionController::Base
    :base_api_controller => ActionController::API,
    # parent_controller needs to be specified if API controllers are inheriting some other controller than ApplicationController
    # :parent_controller => ApplicationController,
    :attributes => {
      :info => {
        "title" => "Coolpix' documentation ReST API",
        "description" => "This is a Coolpix' documentation ReST API ",
        "contact" => "omenkzz@gmail.com",
        "license" => "Apache 2.0",
        "licenseUrl" => "http://www.apache.org/licenses/LICENSE-2.0.html"
      }
    }
  }
})