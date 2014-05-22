require "sitegen"

tools = require "sitegen.tools"

sitegen.create_site =>
  @current_version = "0.0.10"

  scssphp = tools.system_command "sassc < %s > %s", "css"
  coffeescript = tools.system_command "coffee -c -s < %s > %s", "js"

  build scssphp, "reference.scss", "reference.css"
  build scssphp, "home.scss", "home.css"
  build coffeescript, "home.coffee", "home.js"
  build coffeescript, "reference.coffee", "reference.js"

  deploy_to "leaf@leafo.net", "www/lapis/"

  add "lapis/docs/reference.md", target: "reference", template: "reference"
  add "lapis/docs/actions.md", target: "reference/actions", template: "reference"
  add "lapis/docs/database.md", target: "reference/database", template: "reference"
  add "lapis/docs/getting_started.md", target: "reference/getting_started", template: "reference"
  add "lapis/docs/html_generation.md", target: "reference/html_generation", template: "reference"

  add "index.html", template: "home"
  add "changelog.html", template: "home"

