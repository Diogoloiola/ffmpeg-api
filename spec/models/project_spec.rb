require 'rails_helper'

RSpec.describe Project, type: :model do
  describe 'OS name' do
    before do
      ProjectServices::CreateProjectService.new.call
    end

    subject(:project) do
      Project.last
    end

    it 'Visualize path project' do
      os_service = OsServices::System.new
      expect(project.base_directory).to eql("/home/#{os_service.fetch_current_user}/Documents/ffmpeg")
    end

    it 'Visalize current OS' do
      os_service = OsServices::System.new

      current_os = if os_service.mac?
                     'mac'
                   elsif os_service.linux?
                     'linux'
                   end
      expect(project.current_os).to eql(current_os)
    end
  end

  describe 'Presence data in model' do
    it { should validate_presence_of(:base_directory) }
    it { should validate_presence_of(:current_os) }
  end
end
