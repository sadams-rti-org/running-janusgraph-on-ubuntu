// an init script that returns a Map allows explicit setting of global bindings.
def globals = [:]

// defines a sample LifeCycleHook that prints some output to the Gremlin Server console.
// note that the name of the key in the "global" map is unimportant.
globals << [hook : [
        onStartUp: { ctx ->
            ctx.logger.info("Executed once at startup of Gremlin Server.")
        },
        onShutDown: { ctx ->
            ctx.logger.info("Executed once at shutdown of Gremlin Server.")
        }
] as LifeCycleHook]

if (ConfiguredGraphFactory.templateConfiguration==null){
        map = new HashMap<String, Object>();
        map.put("storage.backend","cql");
        map.put("storage.hostname", "catapult-scylla");
        map.put("index.search.backend", "elasticsearch");
        map.put("index.search.hostname", "catapult-elastic");
        ConfiguredGraphFactory.createTemplateConfiguration(new MapConfiguration(map));
}


// define the default TraversalSource to bind queries to - this one will be named "g".
globals << [g : graph.traversal(), g2: graph2.traversal()]
