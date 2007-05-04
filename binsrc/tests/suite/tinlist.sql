
echo both "Test for index usage with in predicate of exp list\n";



create table tinl  (k1 int, k2 int, d1 int, primary key (k1, k2));

insert into tinl values (1, 2, 3);
insert into tinl values (2, 4, 6);
insert into tinl values (3, 6, 9);


select * from tinl where k1 in (1, 1+1, 3, 4);
echo both $if $equ $rowcnt 3 "PASSED" "***FAILED";
echo both ": 1st key in list \n";


select * from tinl where k1 in (1, 1+1, 3, 4) and k2 in (2, 4);
echo both $if $equ $last[1] 2 "PASSED" "***FAILED";
echo both ": 1st and 2nd key in list\n";
echo both $if $equ $rowcnt 2 "PASSED" "***FAILED";
echo both ": 1st and 2nd key in list \n";



select k1 from tinl  where d1 in (2, 3,9);
echo both $if $equ $last[1] 3 "PASSED" "***FAILED";
echo both ": dependent  in list\n";


select d1 from tinl where k2 in (2, 4);
echo both $if $equ $last[1] 6 "PASSED" "***FAILED";
echo both ": 2nd key in list\n";

select a.k1, b.k1 from tinl a, tinl b where b.k1 in (a.d1);
echo both $if $equ $rowcnt 1 "PASSED" "***FAILED";
echo both ":  in list join\n";

select count (*) from sys_users where u_name in (u_name);
