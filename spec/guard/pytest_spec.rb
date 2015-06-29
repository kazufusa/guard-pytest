require "spec_helper"

RSpec.describe Guard::Pytest do
  let(:success_test) { "spec/python/success.py" }
  let(:failure_test) { "spec/python/failure.py" }
  subject { Guard::Pytest.new({pytest_option: "--doctest-modules"}) }

  describe "#start" do
    it "works" do
      subject.start
    end
  end

  describe "#stop" do
    it "works" do
      subject.stop
    end
  end

  describe "#run_all" do
    it "works with all tests" do
      expect($stdout).to receive(:puts).with(include? "#{failure_test} F\n#{success_test} .")
      subject.run_all
    end
  end

  describe "#run_on_modifications" do
    it "works with success test" do
      expect($stdout).to receive(:puts).with(include? "#{success_test} .")
      subject.run_on_modifications([success_test])
    end

    it "works with failure test" do
      expect($stdout).to receive(:puts).with(include? "#{failure_test} F")
      subject.run_on_modifications([failure_test])
    end
  end
end
