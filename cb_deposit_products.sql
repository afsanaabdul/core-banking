
git fetch origin
git checkout 5-depozit-m?hsullar?-alt-modul

create table cb_deposit_products
(id number generated always as identity primary key,
currency_id number,
products_name varchar2(100),
term number(4),
interest_rate number(10,2)); 
create or replace procedure cb_deposit_products_insert
(p_curency_id number, p_product_name varchar2, p_term number, p_interest_rate number)
is begin 
insert into cb_deposit_products(currency_id, product_name, term, interest_rate)
values (p_currency_id, p_product_name, p_term,p_interest_rate);
commit;
end;

cretae or replace procedure cb_deposit_products_update
(p_id number,

p_currency_id number default null,
p_product_name varchar2 default null,
p_term number default null,
p_interest_rate number default null)
is begin 
update cb_deposit_products set 
currency_id =nvl(p_currency_id, currency_id),
product_name=nvl(p_product_name, product_name),
term=nvl(p_term, term),
interest_rate=nvl(p_interest_rate, interest_rate)
where id=p_id;
commit;
end;

begin

--cb_deposit_products_insert (1 'novruz emaneti',3,1.5);
cb_deposit_products_update(1,p_products_name=>'Novruz emaneti')