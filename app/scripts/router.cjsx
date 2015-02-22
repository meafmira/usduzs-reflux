React = require 'react'
Router = require 'react-router'
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute

Layout = require './components/layout'
Home = require './components/home'
Charts = require './components/charts/charts'

routes = (
	<Route name="layout" path="/" handler={Layout}>
		<DefaultRoute handler={Home} />
		<Route name="charts" path="charts" handler={Charts} />
	</Route>
)

exports.start = ->
	Router.run routes, (Handler) ->
		React.render <Handler />,  document.getElementById('content')
