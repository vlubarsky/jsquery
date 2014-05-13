CREATE EXTENSION jsquery;

set escape_string_warning=off;

select 'asd.zzz = 13'::jsquery;
select 'asd.zzz < 13'::jsquery;
select 'asd(zzz < 13)'::jsquery;
select 'asd(zzz < 13 & x = true)'::jsquery;
select 'asd(zzz < 13 & x = "true")'::jsquery;
select 'asd(zzz < 13 & x.zxc = "true")'::jsquery;
select 'asd(zzz < 13 | #.zxc = "true")'::jsquery;
select 'asd(* < 13 & #.zxc = "true")'::jsquery;
select '(* < 13 & #.zxc = "true")'::jsquery;
select '* < 13 & #.zxc = "true"'::jsquery;

select 'a < 1'::jsquery;
select 'a < -1'::jsquery;
select 'a < +1'::jsquery;
select 'a < .1'::jsquery;
select 'a < -.1'::jsquery;
select 'a < +.1'::jsquery;
select 'a < 0.1'::jsquery;
select 'a < -0.1'::jsquery;
select 'a < +0.1'::jsquery;
select 'a < 10.1'::jsquery;
select 'a < -10.1'::jsquery;
select 'a < +10.1'::jsquery;
select 'a < 1e1'::jsquery;
select 'a < -1e1'::jsquery;
select 'a < +1e1'::jsquery;
select 'a < .1e1'::jsquery;
select 'a < -.1e1'::jsquery;
select 'a < +.1e1'::jsquery;
select 'a < 0.1e1'::jsquery;
select 'a < -0.1e1'::jsquery;
select 'a < +0.1e1'::jsquery;
select 'a < 10.1e1'::jsquery;
select 'a < -10.1e1'::jsquery;
select 'a < +10.1e1'::jsquery;
select 'a < 1e-1'::jsquery;
select 'a < -1e-1'::jsquery;
select 'a < +1e-1'::jsquery;
select 'a < .1e-1'::jsquery;
select 'a < -.1e-1'::jsquery;
select 'a < +.1e-1'::jsquery;
select 'a < 0.1e-1'::jsquery;
select 'a < -0.1e-1'::jsquery;
select 'a < +0.1e-1'::jsquery;
select 'a < 10.1e-1'::jsquery;
select 'a < -10.1e-1'::jsquery;
select 'a < +10.1e-1'::jsquery;
select 'a < 1e+1'::jsquery;
select 'a < -1e+1'::jsquery;
select 'a < +1e+1'::jsquery;
select 'a < .1e+1'::jsquery;
select 'a < -.1e+1'::jsquery;
select 'a < +.1e+1'::jsquery;
select 'a < 0.1e+1'::jsquery;
select 'a < -0.1e+1'::jsquery;
select 'a < +0.1e+1'::jsquery;
select 'a < 10.1e+1'::jsquery;
select 'a < -10.1e+1'::jsquery;
select 'a < +10.1e+1'::jsquery;

select 'a in (0,1,2)'::jsquery;
select 'a IN (0,null, "null", xxx, "zzz", 2)'::jsquery;

select '{"a": {"b": null}}'::jsonb @@ 'a.b = 1';
select '{"a": {"b": null}}'::jsonb @@ 'a.b = null';
select '{"a": {"b": null}}'::jsonb @@ 'a.b = false';
select '{"a": {"b": false}}'::jsonb @@ 'a.b = false';
select '{"a": {"b": false}}'::jsonb @@ 'a.b = true';
select '{"a": {"b": true}}'::jsonb @@ 'a.b = true';


select '{"a": {"b": 1}}'::jsonb @@ 'a.b = 1';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b < 1';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b <= 1';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b >= 1';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b > 1';

select '{"a": {"b": 1}}'::jsonb @@ 'a.b = 2';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b < 2';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b <= 2';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b >= 2';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b > 2';

select '{"a": {"b": 1}}'::jsonb @@ 'a.b = 0';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b < 0';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b <= 0';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b >= 0';
select '{"a": {"b": 1}}'::jsonb @@ 'a.b > 0';

select '{"a": {"b": 1}}'::jsonb @@ '*.b > 0';
select '{"a": {"b": 1}}'::jsonb @@ '*.b > 0';
select '{"a": {"b": 1}}'::jsonb @@ 'a.* > 0';
select '{"a": {"b": 1}}'::jsonb @@ 'a.* > 0';

select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b && [ 1 ]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b @> [ 1 ]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b <@ [ 1 ]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b @> [ 1,2,3,4 ]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b <@ [ 1,2,3,4 ]';

select '[{"a": 2}, {"a": 3}]'::jsonb @@ '*.a = 4';
select '[{"a": 2}, {"a": 3}]'::jsonb @@ '*.a = 3';

select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#.a = 4';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '*.a = 4';

select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#(a = 1 | a=3)';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#(a = 3 | a=1)';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#(a = 3 & a=1)';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#(a = 3 & a=2)' as "false";
select '[{"a": 2, "b":3}, {"a": 3, "b": 1}]'::jsonb @@ '#(b = 1 & a=3)';

select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#.a.a = 4';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '*.a.a = 4';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '*.#.a.a = 4';
select '[{"a": 2}, {"a": 3}, {"a": {"a":4}}]'::jsonb @@ '#.*.a.a = 4';

select '{"a": 1}'::jsonb @@ 'a in (0,1,2)';
select '{"a": 1}'::jsonb @@ 'a in (0,2)';

select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.b.#=2';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b && [ 5 ]';

select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a=*';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.b=*';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.c=*';

select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.b = [1,2,3]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.b.# = [1,2,3]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.b && [1,2,3]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.b.# && [1,2,3]';

select 'asd.# = 3'::jsquery & 'zzz = true' | 'xxx.# = zero';
select !'asd.# = 3'::jsquery & 'zzz = true' | !'xxx.# = zero';

select '{"x":[0,1,1,2]}'::jsonb @@ 'x @> [1,0]'::jsquery;
select '{"x":[0,1,1,2]}'::jsonb @@ 'x @> [1,0,1]'::jsquery;
select '{"x":[0,1,1,2]}'::jsonb @@ 'x @> [1,0,3]'::jsquery;

select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b && [ 2 ]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ '*.b($ && [ 2 ])';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.$.b && [ 2 ]';
select '{"a": {"b": [1,2,3]}}'::jsonb @@ 'a.$.b ($ && [ 2 ])';

select '[1,2,3]'::jsonb @@ '# && [2]';
select '[1,2,3]'::jsonb @@ '#($ && [2])';
select '[1,2,3]'::jsonb @@ '$ && [2]';
select '[1,2,3]'::jsonb @@ '$ ($ && [2])';
select '[1,2,3]'::jsonb @@ '$ = 2';
select '[1,2,3]'::jsonb @@ '# = 2';
select '[1,2,3]'::jsonb @@ '#.$ = 2';
select '[1,2,3]'::jsonb @@ '#($ = 2)';

select '{"a": {"b": 3, "c": "hey"}, "x": [5,6]}'::jsonb @@ '%.b=3';
select '{"a": {"b": 3, "c": "hey"}, "x": [5,6]}'::jsonb @@ 'a.%=3';
select '{"a": {"b": 3, "c": "hey"}, "x": [5,6]}'::jsonb @@ '%.%="hey"';
select '{"a": {"b": 3, "c": "hey"}, "x": [5,6]}'::jsonb @@ '%="hey"';
select '{"a": {"b": 3, "c": "hey"}, "x": [5,6]}'::jsonb @@ '%=[5,6]';