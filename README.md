# Simple rack app

Returns time from `/time` route, also takes param `format=year,month,day,hour,minute,second` 
where you can chose any of `year,month,day,hour,minute,second` and write them in any order.

Returns 'Not Found' for other routs.
Returns 'Unknown time format [...]' for not required args of 'format' param.

## How to start:
```
bundle install
rakeup
```
open in browser http://127.0.0.1:9292/time

you can send param `format` f.e.:
http://127.0.0.1:9292/time?format=year,month,day,hour,minute,second
