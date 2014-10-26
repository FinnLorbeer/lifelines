# Lifelines

These are the Watir Tests to be run on the marsair project by Thoughtworks.
They are an example setup of a complex test suite for the given example.

Here you find the entire testsuite. It is using the
[Watir Webdriver](http://watirwebdriver.com/) and the
[Unit Test Framework](http://test-unit.rubyforge.org/).

Firefox works out of the box. Besides firefox you can run the tests in a
headless environment. You need to
[install xvfb](https://github.com/wimdu/livelines#install-xvfb) though.
They can also run in Chrome, when the [Chrome Driver](https://sites.google.com/a/chromium.org/chromedriver/home)
is installed on the system.


As an alternative, you can run them headless on your local machine (in Linux).
```
sudo apt-get install -y xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic xvfb x11-apps  imagemagick
```
Mac user may want to set up a virtual box with Linux or try some fancy hacks to get a headless environment up and running.

# Start the tests

You can start the tests by runing `test` + 1 mandatory argument (which chooses the browser)

```
bundle exec bin/test firefox
```
* Possible options for browser are either `firefox`, `chrome` or `headless`


If an error occurs and you want to rerun a certain test suite use an optional argument -n:

```
bundle exec bin/test firefox -n test_search_form
```

In any case the error output in the console gives you the first clues where to
fix the tests :-)