window.$ = require "jquery"
window.React = require "react"
window.Reflux = require "reflux"

Router = require './router'
Chart = require "chart.js"

#Chart.defaults.global.responsive = true

Router.start()
