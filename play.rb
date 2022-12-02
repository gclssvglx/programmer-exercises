# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem "rspec"
end

require "rspec"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

class Welcome
  def say_hi
    "Hi"
  end
end

RSpec.describe Welcome, "#say_hi" do
  context "we want it to be welcoming" do
    it "says 'Hi' to us" do
      welcome = Welcome.new
      expect(welcome.say_hi).to eq("Hi")
      expect(welcome.say_hi).not_to eq("Goodbye")
    end
  end
end
