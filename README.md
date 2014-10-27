# Lifelines

These are the Watir Tests to be run on the a test project besigned by Thoughtworks.
They are an strip-down example of a complex test suite for a web application.

Here you find the entire testsuite. It is using the
[Watir Webdriver](http://watirwebdriver.com/) and the
[Unit Test Framework](http://test-unit.rubyforge.org/).

## Getting started with Ruby

The tests are written in [Ruby](https://www.ruby-lang.org/en/installation/). 
After installing Ruby you need to install the bundler gem (once):
```
gem install bundler
```
and let the bundler check for (new) ruby packages in this Lifelines repository with
```
bundle install
```

The tests are running in real browsers and "experience" the page like a real user.
They cannot interact with hidden elements or not fully loaded content. One can
run the tests in different browsers:

# Browsers

Firefox works out of the box. Besides Firefox you can run the tests in a
headless environment. You need to [install xvfb](https://github.com/FinnVonFriesland/lifelines#install-xvfb) though.

They can also run in Chrome, when the [Chrome Driver](https://sites.google.com/a/chromium.org/chromedriver/home)
is installed on the system.


# Start the tests

You can start the tests by runing `test_nd_retry <browser>`, where `<browser>` is the name of the browser` you want to run
 the tests in.

* Possible options for browser are either `firefox`, `chrome` or `headless`

Example:

```
bundle exec bin/test_and_retry firefox
```

The following will happen

* You will be running a script (`test_and_retry`) which itself at first starts the `bin/test` script. `bin/test` runs
all written tests in alphabetical order. You see a success or fail console output for every single test. All errors are
printed in the console and logged in a seperate file.
* Second, the `test_and_retry` script will start `bin/retry`. Here all tests that failed before are started once more.
Sometimes tests just fail, eg. because of timeouts in the connection. Thus, to be sure that the found error is reproduceable,
the tests are executed a second time.
* The script will evaluate which errors were reproduceable and in the end give you a summary of all the failed tests (or
tell you that one-time errors were resolved)

## Debuging

When the tests fail you need to find out what exactly went wrong. The following will guide you

* In any case the error output in the console gives you the first clues where to find the error :-)
* Furthermore the backtrace is saved in `log/backtrace.log` for every single fail. Its stripped down to show only
the information you really need but not the entire ruby stacktrace.
* Additionally, the failed test cases are stored in the log files. You find the failing testcase (incl. browser) in `log/errors.log`
* For all these tests that failed reproduceable you will find screenshots in the folder `/screenshots`. They have the same
name as the test, so you can actually look at the page, and see what went wrong.

Probably you will use the combination of console output and screenshots most often, as they are most handy.

When you fixed the code and you want to rerun a specific test suite that failed before (maybe to check if it really works before
running all tests), you can pass the name of the specific test suite with an additional argument `-n` and run the `bin/test` script only:

```
bundle exec bin/test firefox -n test_search_flow_frontpage_elements
```

Happy debugging!

# install xvfb

If you want run the tests headless on your local machine:

* Linux:
```
sudo apt-get install -y xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic xvfb x11-apps  imagemagick
```
* Mac:
 
You may want to set up a virtual box with Linux or set up and use [XQuarz](http://xquartz.macosforge.org/landing/)
(not yet tested by me though)

# contribute

Please fork and share and work on it. Any feedback is highly appreciated!
