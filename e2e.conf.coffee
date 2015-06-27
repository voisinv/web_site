exports.config =

  directConnect: true
  seleniumAdress: 'http://localhost:4444/wd/hub'
  baseUrl: 'http://localhost:9000'
  capabilities:
    browserName: 'chrome'

  specs: ['./tests/e2e/spec.js']

  jasmineNodeOpts:
    showColors: true
    defaultTimeoutInterval: 30000
