#!/usr/bin/env bash
# Run Selenium Server
xvfb-run java -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -jar /usr/local/bin/selenium-server-standalone-3.0.1.jar -debug