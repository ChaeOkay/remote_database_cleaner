require 'remote_database_cleaner/config_struct.rb'

describe RemoteDatabaseCleaner::ConfigStruct do

  describe '.block_to_hash' do
    it 'should be able to configure with a block' do
      class Thing
        def self.configure(&block)
          RemoteDatabaseCleaner::ConfigStruct.block_to_hash(block)
        end
      end

      thing = Thing.configure do |config|
        config.first_name = 'Sam'
        config.last_name  = 'Iam'
      end

      expect(thing.to_hash).to eq({:first_name => 'Sam', :last_name => 'Iam'})
    end
  end
end
