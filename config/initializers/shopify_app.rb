ShopifyApp.configure do |config|

  config.api_key = ""
  config.secret = ""
  config.scope = "read_orders, read_products, write_products, write_script_tags"
  config.embedded_app = true

  config.scripttags = [
    {event:'onload', src: ''}
  ]

end
