# Week 51: The Pillar of Logs and Structured Logging

Today I entered the logging phase of my observability curriculum, focusing on the fundamental shift from unstructured to structured log formats.

## The Purpose of Logging
If metrics tell me *when* a system is failing, logs provide the explicit post-mortem details explaining *what* code execution failed. In a distributed environment, centralizing these records is essential.

## Architectural Comparison
* **Unstructured Logs:** Raw text lines generated arbitrarily by application code. They rely heavily on human parsing and require computationally expensive Regular Expressions (Regex) to index and query at scale.
* **Structured Logs:** Logs formatted explicitly into standardized key-value schemas (typically JSON strings). 

By enforcing structured JSON logs at the application layer, log collectors can instantly map fields (such as `level`, `timestamp`, and custom metadata like `user_id`) into dedicated, indexed database columns. This enables sub-second query performance across terabytes of log data during live incident triages.
