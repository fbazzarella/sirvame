require "spec_helper"

describe NotificationMailer do
  describe "new_lead" do
    let(:mailer) { NotificationMailer.new_lead }

    it "should set correct header From" do
      mailer.header['From'].to_s.should == '"Sirva.me Apps" <webbynode-apps@sirva.me>'
    end

    it "should set correct header To" do
      mailer.header['To'].to_s.should == '"Atendimento Sirva.me" <fale-com@sirva.me>'
    end

    it "should set correct subject" do
      mailer.subject.should == 'Novo Lead!'
    end

    it "should set correct body" do
      mailer.body.to_s.should be_empty
    end

    it "should be added to the delivery queue" do
      lambda { mailer.deliver }.should change(ActionMailer::Base.deliveries, :size).by(1)
    end
  end
end
