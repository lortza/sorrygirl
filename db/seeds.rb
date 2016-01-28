# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Page.create!([
  {
    name: 'About',
    heading: "About this App",
    body: "This is where your content goes",
    slug: 'about',
    publish_state: "Published" 

  },
  {
    name: 'static-home-page',
    heading: "Go to the Root Page",
    body: "Home page content goes here. This page will look weird as 'pages/ static-home-page' so be sure to click on the root to see the actual page",
    slug: 'static-home-page',
    publish_state: "Published" 

  }
])