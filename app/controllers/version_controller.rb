require 'pathname'
class VersionController < ApplicationController

	def index
		redirect_to(action: "download")
	end

	def download
		version_dir = "/home/pedroneto/Downloads"

		@file_versions = []

		Dir.foreach(version_dir) do |valid_path|
			
			@file_versions << version_dir + File::SEPARATOR + valid_path
		end
	end
end
