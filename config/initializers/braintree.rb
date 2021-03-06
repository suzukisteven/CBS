Braintree::Configuration.environment = :sandbox
Braintree::Configuration.logger = Logger.new('log/braintree.log')
Braintree::Configuration.merchant_id = ENV['BRAINTREE_MERCHANT_ID']
Braintree::Configuration.public_key = ENV['BRAINTREE_PUBLIC_KEY']
Braintree::Configuration.private_key = ENV['BRAINTREE_PRIVATE_KEY']

# gateway = Braintree::Gateway.new(
#  :environment => :sandbox,
#  :merchant_id => "pbtrnn2ffnmbjvnr",
#  :public_key => "ywj3b7r7ymbyq76h",
#  :private_key => "a837ec087a871b979e87684aebbd57da"
# )