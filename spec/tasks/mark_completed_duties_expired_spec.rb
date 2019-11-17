require 'spec_helper'
require 'rake'

describe 'it runs through all lands and updates duties' do
  Rake.application.rake_require "tasks/mark_completed_duties_expired"
  Rake::Task.define_task(:environment)

      it 'actually performs the task' do
        result = Rake.application.invoke_task "completed_duties:mark_expired"
        # expect(ItemUpdater).to_not receive(:new)
        # expect(result).to eq("hi mom")
        expect(result).to_not be(nil)

    # context 'and there is one item for that region and other for another region' do
      # let!(:us_item) { FG.create(:item, region: 'US') }
      # let!(:uk_item) { FG.create(:item, region: 'UK') }

      # it 'calls the item updater once' do
        # expect(ItemUpdater).to receive(:new).once.with(us_item.id)
        # expect(true).to eq(true)

        # run_codes_rake_task
      # end
    # end
  # end
      end
end
