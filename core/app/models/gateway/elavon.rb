class Gateway::Elavon < Gateway
  # Two step auth/capture is disabled because creditcard number is also required for capture step.
  # Turn on :auto_capture by running script/console and running "Spree::Config.set :auto_capture => true"
  #
  # Also be sure to change the field ssl_salestax is not required (Required: Yes by default)
  #
  
  FAILURE_MESSAGE = "Two step Authorization/Capture not allowed. Turn on :auto_capture"
  VOID_FAILURE_MESSAGE = "Voiding payments can only be done from the VirtualMerchant web interface"

  preference :login, :string
  preference :password, :string # pin number

  def provider_class
    ActiveMerchant::Billing::ElavonGateway
  end

  def authorize(money, creditcard, options = {})
    ActiveMerchant::Billing::Response.new(false, FAILURE_MESSAGE, {:error => FAILURE_MESSAGE }, :test => true)
  end

  def capture(money, authorization, options = {})
    ActiveMerchant::Billing::Response.new(false, FAILURE_MESSAGE, {:error => FAILURE_MESSAGE }, :test => true)
  end

  def void(authorization, options = {})
    # TODO: Look into Mechanize for VirtualMerchant scripting
    ActiveMerchant::Billing::Response.new(false, VOID_FAILURE_MESSAGE, {:error => VOID_FAILURE_MESSAGE }, :test => true)
  end
end

