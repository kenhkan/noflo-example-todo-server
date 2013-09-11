readInstalled = require "read-installed"
noflo = require "noflo"

databaseUrl = process.env.DATABASE_URL
port = process.env.PORT

initializer = """
  '#{port}' -> LISTEN Graph(todo/Main)
  '#{databaseUrl}' -> DATABASE Graph()
"""

noflo.graph.loadFBP initializer, (graph) ->
  noflo.createNetwork graph, (network) ->
    console.log "Network is ready at #{port}"
    console.log "Database is available at #{databaseUrl}"
