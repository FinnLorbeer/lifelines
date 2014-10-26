class Teardown

  def initialize
    save_screenshot
    close_browser
    $headless.destroy if $headless
  end

  private

  def save_screenshot
    begin
      $b.screenshot.save( File.expand_path("./screenshots/#{$test_name}.png") )
    rescue
      puts 'taking screenshot failed.'
    end
  end

  def close_browser
    begin #Timeout::Error
      Timeout::timeout(10) { $b.close }
    rescue Timeout::Error
      browser_pid = $b.driver.instance_variable_get(:@bridge).instance_variable_get(:@service).instance_variable_get(:@process).pid
      ::Process.kill('KILL', browser_pid)
      sleep 10
    end
  end

end