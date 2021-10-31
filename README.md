# benchmark
Benchmark of Palmyra with Popular frameworks

Scenario: fetch 20 records and total record count from one table.

Sample database script available under dbscripts.

[wrk](https://github.com/wg/wrk) based performance benchmark script is available under wrk_script folder.

### Throughput

Framework |  Avg Req/Sec |  Avg  data transfer/sec 
-----|   ------ | ------
Palmyra | 7900 |  19.25 MB
SpringBoot | 5800 | 16.25 MB
Spring DataRest | 2300 | 18.75 MB


### Concurrency @ 100
Framework |  Avg Latency |  Max Latency | Std Dev
-----|   ------ | ------ | ----
Palmyra | 15.18ms | 140.12ms | 84.26 %
SpringBoot | 18.96ms | 195.61ms | 63.16%
Spring DataRest | 45.57ms | 341.66ms | 60.85%


### Concurrency @ 500
Framework |  Avg Latency |  Max Latency | Std Dev
-----|   ------ | ------ | ----
Palmyra | 83.01ms | 462.49ms | 83.07 %
SpringBoot | 92.46ms | 899.42ms | 86.56%
Spring DataRest | 215.30ms | 1130ms | 85.73%


### Concurrency @ 1000
Framework |  Avg Latency |  Max Latency | Std Dev
-----|   ------ | ------ | ----
Palmyra | 131.17ms | 755.18ms | 34.17 %
SpringBoot | 172.41ms | 1040ms | 84.4%
Spring DataRest | 426.77ms | 1180ms | 85.02%