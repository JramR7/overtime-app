module FakeSms
  Message = Struct.new(:num, :msg)
  @messages = []

  def self.send_sms(num, msg, app)
    @messages << Message.new(num, msg)
  end

  def self.messages
    @messages
  end
end