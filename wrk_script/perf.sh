echo 'Warming Up'
echo 'loop 1'
wrk -t4 -c100 -d60s -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
wrk -t4 -c100 -d60s http://localhost:8080/student
wrk -t4 -c100 -d60s http://localhost:8888/api/v1/Student
echo 'loop 2'
wrk -t4 -c100 -d60s -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
wrk -t4 -c100 -d60s http://localhost:8080/student
wrk -t4 -c100 -d60s http://localhost:8888/api/v1/Student
echo 'loop 3'
wrk -t4 -c100 -d60s -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
wrk -t4 -c100 -d60s http://localhost:8080/student
wrk -t4 -c100 -d60s http://localhost:8888/api/v1/Student

echo '----------------'
echo 'Starting Test'
echo '-----------------'

echo '60 Seconds, 4 Threads, 100 connections'
echo 'Palmyra'
wrk -t4 -c100 -d60s -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
echo 'Spring Data '
wrk -t4 -c100 -d60s http://localhost:8080/student
echo 'Spring Custom'
wrk -t4 -c100 -d60s http://localhost:8888/api/v1/Student

echo '60 Seconds, 4 Threads, 500 connections'
echo 'Palmyra'
wrk -t4 -c500 -d60s -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
echo 'Spring Data '
wrk -t4 -c500 -d60s http://localhost:8080/student
echo 'Spring Custom'
wrk -t4 -c500 -d60s http://localhost:8888/api/v1/Student

echo '60 Seconds, 4 Threads, 1000 connections'
echo 'Palmyra'
wrk -t4 -c1000 -d60s -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
echo 'Spring Data '
wrk -t4 -c1000 -d60s http://localhost:8080/student
echo 'Spring Custom'
wrk -t4 -c1000 -d60s http://localhost:8888/api/v1/Student

echo '5 minutes, 4 Threads, 1000 connections'
echo 'Palmyra'
wrk -t4 -c100 -d5m -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
echo 'Spring Data '
wrk -t4 -c100 -d5m http://localhost:8080/student
echo 'Spring Custom '
wrk -t4 -c100 -d5m http://localhost:8888/api/v1/Student

echo '5 minutes, 4 Threads, 500 connections'
echo 'Palmyra'
wrk -t4 -c500 -d5m -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
echo 'Spring Data '
wrk -t4 -c500 -d5m http://localhost:8080/student
echo 'Spring Custom'
wrk -t4 -c500 -d5m http://localhost:8888/api/v1/Student

echo '5 minutes, 4 Threads, 1000 connections'
echo 'Palmyra'
wrk -t4 -c1000 -d5m -s ./scripts/post.lua http://localhost:6060/palmyra/api/v2/myapp/query/Student
echo 'Spring Data '
wrk -t4 -c1000 -d5m http://localhost:8080/student
echo 'Spring Custom'
wrk -t4 -c1000 -d5m http://localhost:8888/api/v1/Student

