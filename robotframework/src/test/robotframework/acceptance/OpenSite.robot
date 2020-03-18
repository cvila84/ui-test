*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://www.microsoft.com

*** Test Cases ***
Check out microsoft site
	Open Browser    ${url}  chrome
	Close Browser
