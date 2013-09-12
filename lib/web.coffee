noflo = require 'noflo'

databaseUrl = process.env.DATABASE_URL
port = process.env.PORT

initializer = """
  '#{port}' -> PORT Graph(todo/Main)
  '#{databaseUrl}' -> DATABASE Graph() OUT -> IN Output(core/Output)
  Graph() ERROR -> IN OutputError(core/Output)
"""

noflo.graph.loadFBP initializer, (graph) ->
  noflo.createNetwork graph, (network) ->
    console.log "Network is ready at #{port}"
    console.log "Database is available at #{databaseUrl}"
