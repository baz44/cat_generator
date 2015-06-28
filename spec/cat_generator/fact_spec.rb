require 'spec_helper'

describe CatGenerator::Fact do
  let!(:fact) { 'cats are awesome' }
  let!(:request) do
    stub_request(:get, CatGenerator::Fact::CAT_FACTS_API).to_return(body: {facts: [fact], success: true}.to_json,
                                                                    headers: {"Content-Type"=>"application/json"},
                                                                    status: 200)
  end

  describe '.next' do
    it 'calls catfaaats-api to fetch a cat fact' do
      CatGenerator::Fact.next
      expect(request).to have_been_requested
    end

    it 'returns a cat fact' do
      expect(CatGenerator::Fact.next).to eq fact
    end

    it 'returns nil if no fact can be fetched' do
      stub_request(:get, CatGenerator::Fact::CAT_FACTS_API).to_return(status: 400)
      expect(CatGenerator::Fact.next).to be_nil
    end
  end
end
