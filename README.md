<center>
  <a href="https://www.ruby-lang.org/en/">
    <img src="https://img.shields.io/badge/Ruby-v2.6.5-green.svg" alt="ruby version">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://img.shields.io/badge/HTML2Slim-v0.2.0-brightgreen.svg" alt="html2slim version">
  </a>
  <a href="https://codeclimate.com/github/gizipp/slim-converter-api/maintainability">
  <img src="https://api.codeclimate.com/v1/badges/ea5a802da76b903de2fd/maintainability" />
  </a>
  <a href="https://codeclimate.com/github/gizipp/slim-converter-api/test_coverage">
    <img src="https://api.codeclimate.com/v1/badges/ea5a802da76b903de2fd/test_coverage" />
  </a>
  <img src="https://img.shields.io/github/languages/code-size/gizipp/slim-converter-api" alt="GitHub code size in bytes">
</center>

# Slim Converter API

This API powering [HTML / ERB to Slim Converter](https://tools.gizipp.com/html-erb-to-slim) - [GIZ Tool](https://tools.gizipp.com).

## Usage

### Via curl

```bash
curl --location --request POST 'https://slim-converter-api.herokuapp.com/convert' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'raw_text=<html>
   <head>
     <title>Enter Your Code Here</title>
   <%= foo = [1,2,3] %>
   <body>
     <%= foo.each do |bar| %>
     <p>Or click Convert to test it out!</p>
   </body>
   </head>
 </html>'
 ```

### Via Jquery

https://playcode.io/552904

```javascript
var form = new FormData();
form.append("raw_text", `<html>
   <head>
     <title>Enter Your Code Here</title>
   <%= foo = [1,2,3] %>
   <body>
     <%= foo.each do |bar| %>
     <p>Or click Convert to test it out!</p>
   </body>
   </head>
 </html>`);

var settings = {
  "url": "https://slim-converter-api.herokuapp.com/convert",
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
    <img src="https://badgen.net/uptime-robot/status/ur59092-542310e3aa2b9d1a43f48a46" alt="status">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/day/ur59092-542310e3aa2b9d1a43f48a46" alt="(24 hours) uptime">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/week/ur59092-542310e3aa2b9d1a43f48a46" alt="(past week) uptime">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/month/ur59092-542310e3aa2b9d1a43f48a46" alt="(past month) uptime">
  </a>
  <a href="https://github.com/slim-template/html2slim">
    <img src="https://badgen.net/uptime-robot/response/ur59092-542310e3aa2b9d1a43f48a46" alt="(last hour) response">
  </a>
</center>
</br>

Feel free to use it, but uptime is not guarantee or deploy this API in Heroku.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/gizipp/slim-converter-api)
