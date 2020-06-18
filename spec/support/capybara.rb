Capybara.register_driver :chrome do |app|
  args = %w(disable-gpu mute-audio window-size=1280,800 lang=ja)
  args << 'headless' unless ENV['NO_HEADLESS']

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: args,
        w3c: false
      }
    )
  )
end

Capybara.default_driver = :chrome