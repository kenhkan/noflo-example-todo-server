noflo = require 'noflo'

databaseUrl = process.env.DATABASE_URL
port = process.env.PORT

initializer = """
  '#{port}' -> PORT Main(todo/Main)
  '#{databaseUrl}' -> DATABASE Main()
"""

noflo.graph.loadFBP initializer, (graph) ->
  noflo.createNetwork graph, (network) ->
    console.log "Network is ready at #{port}"
    console.log "Database is available at #{databaseUrl}"
