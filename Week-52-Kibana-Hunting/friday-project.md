# Week 52 Project: Kibana Log Dashboards

Today I executed the final project of Month 13: translating raw EFK log data into an executive-level Kibana dashboard.

## Visualization Engineering
While KQL is essential for deep incident debugging, high-level system health is best monitored via visual aggregations. I utilized Kibana Lens to construct a two-panel dashboard focused strictly on the FinTech application namespace:

1. **Log Level Distribution (Pie Chart):** Aggregated the `level` key across all JSON logs. This provides an immediate visual indicator of application health. Under normal operations, the chart is entirely `INFO`. If an `ERROR` slice appears and expands, it signals an immediate incident.
2. **Log Volume Over Time (Bar Chart):** Mapped total log generation against the `@timestamp` axis. This allows me to visually correlate traffic spikes or error cascades to specific moments in time.

By building this dashboard, I have abstracted the complexity of structured JSON logs into a "Single Pane of Glass" suitable for client handover and rapid operational monitoring.

