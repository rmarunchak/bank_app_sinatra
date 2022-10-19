require_relative '../spec/spec_helper'

RSpec.describe 'Work with file' do
  describe 'working with file' do
    it 'file can be opened' do
      file = File.open('./client_base.json', 'r+')
      expect(file).not_to be nil
    end

    it 'file should be hash' do
      file = File.open('./client_base.json', 'r+')
      users = JSON(file.read)
      expect(users.class).to eq(Array)
    end
  end
end