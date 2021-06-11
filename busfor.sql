CREATE TABLE RESERVE(
  id_reserve INTEGER NOT NULL,
  id_destination INTEGER, 
  date_reserve DATE,
  price INTEGER,
  id_employee INTEGER,
  id_customer INTEGER,
  id_timetable INTEGER,
  date_travel DATE,
  number_of_tickets INTEGER,
  TIME_HOUR NUMBER(5,2),
  CONSTRAINT RESERVE_PK PRIMARY KEY (id_reserve)
);
CREATE TABLE EMPLOYEE(
  id_employee INTEGER NOT NULL,
  name_employee VARCHAR2(30),
  phone_employee INTEGER,
  id_reserve INTEGER,
  CONSTRAINT EMPLOYEE_PK PRIMARY KEY (id_employee),
  CONSTRAINT EMP_RES_FK FOREIGN KEY(id_reserve)
  REFERENCES RESERVE(id_reserve)
);
CREATE TABLE CUSTOMER(
  id_customer INTEGER NOT NULL,
  name_customer VARCHAR2(30),
  phone_customer INTEGER,
  id_reserve integer,
  CONSTRAINT CUSTOMER_PK PRIMARY KEY (id_customer),
  CONSTRAINT CUS_RES_FK FOREIGN KEY(id_reserve)
  REFERENCES RESERVE(id_reserve)
);

CREATE TABLE TIMETABLEE(
  id_timetable INTEGER NOT NULL,
  day_week DATE,
  id_destination integer,
  number_of_members INTEGER,
  id_reserve INTEGER,
  TIME_TIME NUMBER(5,2),
  CONSTRAINT TIMETABLEE_PK PRIMARY KEY (id_timetable),
  CONSTRAINT TIME_RES_FK FOREIGN KEY(id_reserve)
  REFERENCES RESERVE(id_reserve)
);
CREATE TABLE DESTiNATION(
  id_destination INTEGER NOT NULL,
  destination VARCHAR2(30),
  id_reserve INTEGER,
  ID_TIMETABLE INTEGER,
  CONSTRAINT DESTiNATION_PK PRIMARY KEY (id_destination),
  CONSTRAINT DES_RES_FK FOREIGN KEY(id_reserve)
  REFERENCES RESERVE(id_reserve),
  CONSTRAINT DES_Time_FK FOREIGN KEY(id_timetable)
  REFERENCES TIMETABLEE(id_timetable)
  
);
CREATE TABLE POSITION(
  id_position INTEGER NOT NULL,
  position VARCHAR2(30),
  id_employee INTEGER,
  CONSTRAINT POSITION_PK PRIMARY KEY (id_position),
  CONSTRAINT POS_EMP_FK FOREIGN KEY(id_employee)
  REFERENCES EMPLOYEE(id_employee)
);
INSERT INTO EMPLOYEE(id_employee, name_employee, phone_employee, id_reserve)
VALUES(1,'John', 3216547892, 1);
commit;
INSERT INTO EMPLOYEE(id_employee, name_employee, phone_employee, id_reserve)
VALUES(2, 'Annie', 5468798765, 2);
commit;
INSERT INTO EMPLOYEE(id_employee, name_employee, phone_employee, id_reserve)
VALUES(&id_emp, &name, &number, &id_res);
commit;


INSERT INTO CUSTOMER(id_customer, name_customer, phone_customer, id_reserve)
VALUES(1, 'Georgi', 45678945679, 2);
commit;
INSERT INTO CUSTOMER(id_customer, name_customer, phone_customer, id_reserve)
VALUES(2,'Filip', 3214569874, 1);
commit;
INSERT INTO CUSTOMER(id_customer, name_customer, phone_customer, id_reserve)
VALUES(&id_cus, &name, &number, &id_res);
commit;


INSERT INTO POSITION(id_position, position, id_employee)
VALUES(1, 'Driver', 2);
commit;
INSERT INTO POSITION(id_position, position, id_employee)
VALUES(2, 'Administrator', 1);
commit;
INSERT INTO POSITION(id_position, position, id_employee)
VALUES(&id, &pos, &id_emp);
commit;


INSERT INTO DESTINATION(id_destination, destination,id_reserve,ID_TIMETABLE)
VALUES(1,'Varna', 2, 2);
commit;
INSERT INTO DESTINATION(id_destination, destination,id_reserve,ID_TIMETABLE)
VALUES(2, 'Sofia', 1, 1);
commit;
INSERT INTO DESTINATION(id_destination, destination, id_reserve, ID_TIMETABLE)
VALUES(&id_destination, &destination, &id_reserve, &ID_TIMETABLE);
commit;

INSERT INTO TIMETABLEE(id_timetable, day_week, id_destination, number_of_members, TIME_TIME,id_reserve)
VALUES(1, '16-DEC-2019', 2, 2, 10.25, 2);
commit;
INSERT INTO TIMETABLEE(id_timetable, day_week, id_destination, number_of_members, TIME_TIME, id_reserve)
VALUES(2, '05-OCT-18', 1, 1, 19.50, 1);
commit;
INSERT INTO TIMETABLEE(id_timetable, day_week, id_destination, number_of_members, TIME_TIME,id_reserve)
VALUES(&id_timetable, &day_week, &id_destination, &number_of_members, &TIME_TIME, &id_reserve);
commit;

INSERT INTO RESERVE(id_reserve, id_destination, date_reserve, price, id_employee, id_customer, id_timetable, date_travel, number_of_tickets, TIME_HOUR)
VALUES(1, 2, '28-MAR-20', 35, 1, 2, 2, '30-MAR-20', 65, 15.36);
commit;
INSERT INTO RESERVE(id_reserve, id_destination, date_reserve, price, id_employee, id_customer, id_timetable, date_travel, number_of_tickets, TIME_HOUR)
VALUES(2, 1, '15-JAN-19', 21, 2, 1, 1, '30-JAN-19', 12, 09.13);
commit;
INSERT INTO RESERVE(id_reserve, id_destination, date_reserve, price, id_employee, id_customer, id_timetable, date_travel, number_of_tickets, TIME_HOUR)
VALUES(&id_reserve, &id_destination, &date_reserve, &price, &id_employee, &id_customer, &id_timetable, &date_travel, &number_of_tickets, &TIME_HOUR);
commit;
UPDATE DESTINATION
       SET destination = 'Burgas'
       WHERE id_destination = 1;
UPDATE EMPLOYEE
       SET name_employee = 'Jured',
           phone_employee = 1234567891
       WHERE id_employee = 1;
UPDATE POSITION
       SET POSITION = 'MANAGER'
       WHERE ID_POSITION = 2;
UPDATE RESERVE
       SET price = 50
       WHERE ID_RESERVE = 2;
UPDATE CUSTOMER
       SET NAME_CUSTOMER = 'Marina'
       WHERE ID_CUSTOMER = 1;
UPDATE TIMETABLE
       SET TIME_TIME = 19.55
       WHERE ID_TIMETABLE = 2;

SELECT t.day_week ,t.time_time ,d.id_destination ,d.destination
FROM DESTINATION d  JOIN TIMETABLEE t
on (d.ID_DESTINATION = t.ID_DESTINATION)
where d.destination = &destination;

SELECT t.day_week ,t.time_time ,d.id_destination ,d.destination
FROM DESTINATION d  JOIN TIMETABLEE t
on (d.ID_DESTINATION = t.ID_DESTINATION)
where t.TIME_TIME = &time;

SELECT t.day_week ,t.time_time ,d.id_destination ,d.destination
FROM DESTINATION d  JOIN TIMETABLEE t
on (d.ID_DESTINATION = t.ID_DESTINATION)
where t.DAY_WEEK = &data;


select r.number_of_tickets, t.NUMBER_OF_MEMBERS, r.number_of_tickets - sum(t.NUMBER_OF_MEMBERS) as free_of_destination,
           r.number_of_tickets - sum(t.NUMBER_OF_MEMBERS) as free_of_day,
           r.number_of_tickets - sum(t.NUMBER_OF_MEMBERS) as free_of_time
from TIMETABLEE t  join reserve r
on (t.id_reserve = r.id_reserve) 
group by t.ID_DESTINATION, t.DAY_WEEK, t.ID_TIMETABLE, r.number_of_tickets, t.NUMBER_OF_MEMBERS;


select r.id_customer, c.name_customer, sum(t.NUMBER_OF_MEMBERS)
from reserve r  
join TIMETABLEE t on (t.id_reserve = r.id_reserve)
join CUSTOMER c on (r.ID_CUSTOMER = c.ID_CUSTOMER )
group by r.ID_CUSTOMER, c.name_customer;


select c.name_customer as name, t.number_of_members as tickets, d.destination, t.DAY_WEEK as day
from reserve r  
join TIMETABLEE t on (t.id_reserve = r.id_reserve)
join CUSTOMER c on (r.ID_CUSTOMER = c.ID_CUSTOMER )
join DESTINATION d on (r.ID_DESTINATION = d.ID_DESTINATION)
where DAY_WEEK between &day and &day_to
order by t.DAY_WEEK;
       
DELETE FROM DESTINATION
       WHERE ID_DESTINATION = 1;
DELETE FROM EMPLOYEE
       WHERE id_employee = 2;
DELETE FROM POSITION
       WHERE ID_POSITION = 1;
DELETE FROM CUSTOMER
       WHERE ID_CUSTOMER = 2;
DELETE FROM TIMETABLE
       WHERE ID_TIMETABLE = 1;
DELETE FROM  RESERVE
       WHERE ID_RESERVE = 1;


