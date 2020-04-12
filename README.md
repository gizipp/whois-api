<center>
  <a href="https://www.ruby-lang.org/en/">
    <img src="https://img.shields.io/badge/Ruby-v2.6.5-green.svg" alt="ruby version">
  </a>
  <a href="https://github.com/weppos/whois">
    <img src="https://img.shields.io/badge/whois-v5.0.1-brightgreen.svg" alt="whois version">
  </a>
  <a href="https://codeclimate.com/github/gizipp/domain-checker-api/maintainability">
  <img src="https://api.codeclimate.com/v1/badges/ea5a802da76b903de2fd/maintainability" />
  </a>
  <a href="https://codeclimate.com/github/gizipp/domain-checker-api/test_coverage">
    <img src="https://api.codeclimate.com/v1/badges/ea5a802da76b903de2fd/test_coverage" />
  </a>
  <img src="https://img.shields.io/github/languages/code-size/gizipp/domain-checker-api" alt="GitHub code size in bytes">
</center>

# Domain Checker API

This API powering [Domain Checker](https://tools.gizipp.com/domain-checker) - [GIZ Tool](https://tools.gizipp.com).

## Usage

### Via curl

```bash
curl --location --request POST 'https://domain-checker-api.herokuapp.com/check' --form 'domain=gizipp.io'
 ```
Example response

 ```json
 {
    "gizipp.com": false,
    "gizipp.net": true,
    "gizipp.org": true,
    "gizipp.io": true
}
 ```

### Via Jquery

```javascript
var form = new FormData();
form.append("domain", "gizipp.io");

var settings = {
  "url": "https://domain-checker-api.herokuapp.com/check",
  "method": "POST",
  "timeout": 0,
  "processData": false,
  "mimeType": "multipart/form-data",
  "contentType": false,
  "data": form
};

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

## API Status

<center>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/status/m784727193-2e6ba9e689f7a6a11093a75c" alt="status">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/day/m784727193-2e6ba9e689f7a6a11093a75c" alt="(24 hours) uptime">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/week/m784727193-2e6ba9e689f7a6a11093a75c" alt="(past week) uptime">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/month/m784727193-2e6ba9e689f7a6a11093a75c" alt="(past month) uptime">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/response/m784727193-2e6ba9e689f7a6a11093a75c" alt="(last hour) response">
  </a>
</center>
</br>

Feel free to use it, but uptime is not guarantee or deploy this API in Heroku.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/gizipp/domain-checker-api)
