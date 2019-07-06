create table june24_books
( id  number(5) primary key,
  title varchar(50) not null,
  author varchar(50),
  price  number(4)
);

create sequence june24_books_id start with 1 increment by 1 nocache;

insert into june24_books values(june24_books_id.nextval,
  'Java Comp. Ref','Herbert Schildt',600);
  
insert into june24_books values(june24_books_id.nextval,
  'Spring in Action','Johnson',700);
  
insert into june24_books values(june24_books_id.nextval,
  'Angular','Debu Kuratha',450);  
  
commit;

  
  
