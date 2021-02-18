#!/bin/bash

# for coloring prints
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\u001b[37m'

# ON_ERROR_STOP=1 flag causes execution to stop if it encounters an error. Discards all the changes inside 'begin'
psql -U postgres $1 -o /dev/null -v "ON_ERROR_STOP=1" << EOF
begin;
alter table students add column st_id int;
update students set st_id=student_id;
alter table students alter column st_name type varchar(15);
alter table students alter column st_last type varchar(15);
alter table students drop column student_id;
alter table interests add column interest text;
insert into interests(student_id, interest) select student_id, unnest(interests) from interests;
delete from interests where interests.interest is null;
alter table interests drop column interests;
commit;
EOF

# printing result
(($? > 0)) && echo -e "${RED}Error occurred. DB reverted to initial state${WHITE}" || echo -e "${GREEN}Rollback successful!${WHITE}"
