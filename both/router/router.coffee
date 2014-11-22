Router.route '/', {name: "landing", controller: "LandingController"}
Router.route "dashboard", {controller: "DashboardController"}
Router.route "logout", {controller: "LogoutController"}