# frozen_string_literal: true

shared_examples 'a list operation' do
  subject(:list) do
    defined?(params) ? described_class.all(params) : described_class.all
  end

  around do |test|
    VCR.use_cassette("#{resource_name}/list") { test.run }
  end

  it "fetches all resource's occurrences" do
    expect(list).to be_an(Array)
    expect(list.count).to eq(results_count)
    expect(list.first).to be_a(described_class)
  end

  it 'logs the request' do
    expect do
      list
    end.to change { fake_logger.infos.count }.by(1)
       .and change { fake_logger.infos.last }.to include('get', resource_name)
  end
end

shared_examples 'a list operation on an instantiated class' do
  subject(:list) do
    described_class.new(resource_params).all
  end

  around do |test|
    VCR.use_cassette("#{resource_name}/list") { test.run }
  end

  it "fetches all resource's occurrences" do
    expect(list).to be_an(Array)
    expect(list.count).to eq(results_count)
    expect(list.first).to be_a(described_class)
  end

  it 'logs the request' do
    expect do
      list
    end.to change { fake_logger.infos.count }.by(1)
       .and change { fake_logger.infos.last }.to include('get', resource_name)
  end
end
