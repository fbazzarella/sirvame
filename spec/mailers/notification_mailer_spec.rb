# encoding: utf-8
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

  describe "fix_phone" do
    let(:mailer) { NotificationMailer.fix_phone({id: 1, name: 'Name', phone: '(12) 3456-7890'}) }

    it "should set correct header From" do
      mailer.header['From'].to_s.should == '"Sirva.me Apps" <webbynode-apps@sirva.me>'
    end

    it "should set correct header To" do
      mailer.header['To'].to_s.should == '"Atendimento Sirva.me" <fale-com@sirva.me>'
    end

    it "should set correct subject" do
      mailer.subject.should == 'Nova Sugestão de Correção!'
    end

    it "should set correct body" do
      mailer.body.to_s.should include('1', 'Name', '(12) 3456-7890')
    end

    it "should be added to the delivery queue" do
      lambda { mailer.deliver }.should change(ActionMailer::Base.deliveries, :size).by(1)
    end
  end
end
