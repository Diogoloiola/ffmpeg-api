class Project < ApplicationRecord
  before_create :set_os
  before_save :create_base_directory
  validate :validate_os
  validate :exist_project?

  private

  def exist_project?
    return if Project.count.zero?

    errors.add(:base, 'There is already a project created')
  end

  def validate_os
    os_service = OsServices::System.new
    return if [os_service.mac?, os_service.linux?].count { |value| value == true } >= 1

    errors.add(:base, 'Operating system does not support this application')
  end

  def create_base_directory
    os_service = OsServices::System.new

    self.base_directory = "/home/#{os_service.fetch_current_user}/Downloads/ffmpeg"

    return if Rails.env.test?

    FileUtils.mkdir_p("#{base_directory}/audio")
    FileUtils.mkdir_p("#{base_directory}/video")
  end

  def set_os
    os_service = OsServices::System.new

    self.current_os = if os_service.mac?
                        'mac'
                      elsif os_service.linux?
                        'linux'
                      end
  end
end
