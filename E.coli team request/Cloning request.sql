SELECT 
    a.id as "Request",
    a.protein as "Protein",
    a.date_needed as "Date request",
    b.name as "Requestor",
    a.status$ as "Status"
    
from qcrg.ecoli_clone as a
inner join (select id, name from qcrg.user) as b on a.creator_id$ = b.id
where not a.status$ = 'CANCELLED'
order by date_needed desc, status$ desc
