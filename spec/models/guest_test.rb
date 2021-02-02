require 'rails_helper'

RSpec.describe Guest do
  describe 'relationships' do
    it { should belong_to :invitee }
    it { should belong_to :watch_party }
  end
end
