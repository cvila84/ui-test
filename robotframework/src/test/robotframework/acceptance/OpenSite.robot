*** Settings ***
Library     SeleniumLibrary
Test Teardown  Close All Browsers

*** Variables ***
${url}      https://www.microsoft.com
${proxy}    10.43.216.8:8080

*** Test Cases ***
Check out microsoft site on chrome
	Open Browser    ${url}  chromeheadless  desiredCapabilities={"proxy":{"proxyType":"MANUAL","autodetect":false,"httpProxy":"${proxy}","noProxy":"","sslProxy":"${proxy}"}}
	Wait Until Element Is Visible   primaryArea

Check out microsoft site on firefox
    Open Browser    ${url}  firefoxheadless     desiredCapabilities={"proxy":{"proxyType":"MANUAL","autodetect":false,"httpProxy":"${proxy}","noProxy":"","sslProxy":"${proxy}"}}
	Wait Until Element Is Visible   primaryArea
