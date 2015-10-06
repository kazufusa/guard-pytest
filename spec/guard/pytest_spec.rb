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
      expect(subject).to receive(:system).with("py.test", "--doctest-modules").and_return(true)
      subject.run_all
    end
  end

  describe "#run_on_modifications" do
    context "with a success test" do
      it "works" do
        expect(subject).to receive(:system).with("py.test", "--doctest-modules", success_test).and_return(true)
        subject.run_on_modifications([success_test])
      end
    end

    context "with a failure test" do
      before do
        allow(subject).to receive(:system).with("py.test", "--doctest-modules", failure_test).and_return(false)
      end

      it "throws :task_has_failed" do
        expect(subject).to receive(:throw).with(:task_has_failed)
        subject.run_on_modifications([failure_test])
      end
    end

    context "when py.test is not installed" do
      before do
        allow(subject).to receive(:system).with("py.test", "--doctest-modules", success_test).and_return(nil)
      end
      it "throws :task_has_failed" do
        expect(subject).to receive(:throw).with(:task_has_failed)
        subject.run_on_modifications([success_test])
      end
    end
  end

  describe "shell expansion" do
    context "when options contain shell words" do
      subject { Guard::Pytest.new({pytest_option: "-x --ignore='foo bar' -q"}) }

      it "correctly splits the options" do
        expected_args = ["py.test", "-x", "--ignore=foo bar", "-q", 'foo']
        expect(subject).to receive(:system).with(*expected_args).and_return(true)
        subject.run_on_modifications(['foo'])
      end
    end
  end
end
