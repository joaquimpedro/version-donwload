require 'pathname'
class VersionController < ApplicationController

	def index
		redirect_to(action: "download")
	end

	def download
		config = YAML.load_file("config/properties.yml")
		version_dir = config['download']
		@file_versions = []

		Dir.foreach(version_dir) do |valid_path|
			@file_versions << valid_path
		end
	end

	def baixar
		send_file(params[:path])
	end
end
