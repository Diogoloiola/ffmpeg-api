require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should validate_presence_of(:base_directory) }
  it { should validate_presence_of(:current_os) }
end
