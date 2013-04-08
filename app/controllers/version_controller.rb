require 'pathname'
class VersionController < ApplicationController

	@@version_dir = ""
	def initialize()
		config = YAML.load_file("config/properties.yml")
		@@version_dir = config['download']
	end

	def index
		redirect_to(action: "list_downloads")
	end

	def list_downloads
		@file_versions = []

		Dir.foreach(@@version_dir) do |valid_path|
			@file_versions << valid_path
		end
	end

	def download
		send_file(@@version_dir + File::SEPARATOR +  params[:path])
	end
end
