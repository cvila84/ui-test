*** Settings ***
Library     SeleniumLibrary
Test Teardown  Close All Browsers

*** Variables ***
${url1}     https://www.microsoft.com
${url2}     https://wrong.host.badssl.com
${proxy}    10.43.216.8:8080

*** Test Cases ***
Check out microsoft site with proxy on chrome
#	Open Browser    ${url1}  chromeheadless  desiredCapabilities={"proxy":{"proxyType":"MANUAL","autodetect":false,"httpProxy":"${proxy}","noProxy":"","sslProxy":"${proxy}"}}
	Open Browser    ${url1}  chromeheadless  desiredCapabilities={"proxy":{"proxyType":"DIRECT"}}
	Wait Until Element Is Visible   primaryArea

Check out microsoft site with proxy on firefox
#    Open Browser    ${url1}  firefoxheadless     desiredCapabilities={"proxy":{"proxyType":"MANUAL","autodetect":false,"httpProxy":"${proxy}","noProxy":"","sslProxy":"${proxy}"}}
    Open Browser    ${url1}  firefoxheadless     desiredCapabilities={"proxy":{"proxyType":"DIRECT"}}
	Wait Until Element Is Visible   primaryArea

Check out badssl site with insecure cert accepted on chrome
#    Open Browser    ${url2}     chrome  desiredCapabilities={"acceptInsecureCerts":true,"proxy":{"proxyType":"MANUAL","autodetect":false,"httpProxy":"${proxy}","noProxy":"","sslProxy":"${proxy}"}}
    Open Browser    ${url2}     chrome  desiredCapabilities={"acceptInsecureCerts":true,"proxy":{"proxyType":"DIRECT"}}
	Wait Until Element Is Visible   content

Check out badssl site with insecure cert accepted on firefox
#    Open Browser    ${url2}     firefox  desiredCapabilities={"acceptInsecureCerts":true,"proxy":{"proxyType":"MANUAL","autodetect":false,"httpProxy":"${proxy}","noProxy":"","sslProxy":"${proxy}"}}
    Open Browser    ${url2}     firefox  desiredCapabilities={"acceptInsecureCerts":true,"proxy":{"proxyType":"DIRECT"}}
	Wait Until Element Is Visible   content
