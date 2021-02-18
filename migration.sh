#!/bin/bash

# for coloring prints
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\u001b[37m'

# ON_ERROR_STOP=1 flag causes execution to stop if it encounters an error. It reverts table to its initial state
psql -U postgres $1 -o /dev/null -v "ON_ERROR_STOP=1" << EOF
begin;
alter table students add column student_id int;
update students set student_id=st_id;
alter table students alter column st_name type varchar(30);
alter table students alter column st_last type varchar(30);
alter table students drop column st_id;
alter table interests add column interests varchar(15)[];
insert into interests(student_id, interests) select student_id,  array_agg(interest) from interests group by(student_id);
delete from interests where interests.interests is null;
alter table interests drop column interest;
commit;
EOF

# printing migration result
(($? > 0)) && echo -e "${RED}Error occurred while migration. Performing rollback.${WHITE}" || echo -e "${GREEN}Migrated successfully!${WHITE}"
