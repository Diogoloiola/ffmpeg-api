class Project < ApplicationRecord
  validates :base_directory, :current_os, presence: true

  enum current_os: {
    linux: 0,
    mac: 1
  }
end
