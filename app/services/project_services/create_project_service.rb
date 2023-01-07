module ProjectServices
  class CreateProjectService
    def initialize(folder: 'Documents', project_name: 'ffmpeg')
      @folder = folder
      @project_name = project_name
      @os_service = OsServices::System.new
    end

    def call
      validate_os
      exist_project?
      create_directorys

      Project.create!(
        base_directory: @base_directory,
        current_os: fetch_current_os
      )
    end

    private

    def create_directorys
      @base_directory = "/home/#{@os_service.fetch_current_user}/#{@folder}/#{@project_name}"

      return if Rails.env.test?

      FileUtils.mkdir_p("#{@base_directory}/audio")
      FileUtils.mkdir_p("#{@base_directory}/video")
    end

    def exist_project?
      return if Project.count.zero?

      raise 'There is already a project created'
    end

    def validate_os
      return if [@os_service.mac?, @os_service.linux?].count { |value| value == true } >= 1

      raise 'Operating system does not support this application'
    end

    def fetch_current_os
      if @os_service.mac?
        'mac'
      elsif @os_service.linux?
        'linux'
      end
    end
  end
end
