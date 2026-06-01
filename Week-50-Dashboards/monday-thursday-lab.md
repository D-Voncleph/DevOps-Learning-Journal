# Week 50: Mastering PromQL

Over this lab block, I studied PromQL, the mathematical query language used by Prometheus to analyze time-series data. 

## Key PromQL Concepts
Unlike SQL, which queries relational data, PromQL queries vectors (data points mapped to timestamps). I focused on the three core pillars of PromQL:
1. **Label Matching (Selectors):** Using `{key="value"}` syntax to filter metrics down to specific namespaces, apps, or nodes.
2. **Rate Calculations:** Utilizing the `rate()` function to convert steadily climbing counters (like total HTTP requests) into actionable velocity metrics (requests per second).
3. **Aggregation:** Using operators like `sum()`, `avg()`, and `max()` to consolidate data across multiple ephemeral pods into a single, cohesive metric line.
