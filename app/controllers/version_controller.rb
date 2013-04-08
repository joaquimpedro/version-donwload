require 'pathname'
class VersionController < ApplicationController

	@@version_dir = ""
	def initialize()
		config = YAML.load_file("config/properties.yml")
		@@version_dir = config['download']
	end

	def index
		redirect_to(action: "download")
	end

	def download
		@file_versions = []

		Dir.foreach(@@version_dir) do |valid_path|
			@file_versions << valid_path
		end
	end

	def baixar
		send_file(@@version_dir + File::SEPARATOR +  params[:path])
	end
end
