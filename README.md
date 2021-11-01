# benchmark
Benchmark of Palmyra with Popular frameworks

Scenario: fetch 20 records and total record count from one table.

Test Environment:

* JDK 11
* MariaDB 10.6
* Intel NUC 8i5 (8259U, 16GB RAM)


Sample database script available under dbscripts.

[wrk](https://github.com/wg/wrk) based performance benchmark script is available under wrk_script folder.


### Throughput

Framework |  Avg Req/Sec |  Avg  data transfer/sec 
-----|   ------ | ------
Palmyra | 7900 |  19.25 MB
SpringBoot | 5800 | 16.25 MB
Spring DataRest | 2300 | 18.75 MB


### Concurrency @ 100
Framework |  Avg Latency |  Max Latency | Req/Sec | Std Dev
-----|   ------ | ------ | ---- |---
Palmyra | 15.18ms | 140.12ms | 8028 | 84.26 %
SpringBoot | 18.96ms | 195.61ms | 5776 | 63.16%
Spring DataRest | 45.57ms | 341.66ms | 2361 | 60.85%


### Concurrency @ 500
Framework |  Avg Latency |  Max Latency | Req/Sec | Std Dev
-----|   ------ | ------ | ---- | --
Palmyra | 83.01ms | 462.49ms | 7984 | 83.07 %
SpringBoot | 92.46ms | 899.42ms | 5834 | 86.56%
Spring DataRest | 215.30ms | 1130ms | 2345 | 85.73%


### Concurrency @ 1000
Framework |  Avg Latency |  Max Latency | Req/Sec | Std Dev
-----|   ------ | ------ | ---- | --
Palmyra | 131.17ms | 755.18ms | 7973 | 34.17 %
SpringBoot | 172.41ms | 1040ms | 5842 | 84.4%
Spring DataRest | 426.77ms | 1180ms | 2337 | 85.02%