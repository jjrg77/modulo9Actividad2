-- ejercicio1
select count(*) as total from flights;

-- ejercicio2
select Origin, AVG(ArrDelay) as prom_arribades, avg(DepDelay) as prom_sortides
from flights group by Origin order by Origin ASC;

-- ejercicio3
select Origin as origin, colYear, colMonth, format(ArrDelay,4) as prom_arribades
from flights order by Origin, colYear ASC, colMonth ASC;

-- ejercicio 4
select f2.City, colYear, colMonth, format(ArrDelay,4) as prom_arribades
from flights f1 inner join usairports f2 on f2.IATA = f1.Origin
order by f2.City, colYear ASC, colMonth ASC;

-- ejercicio 5
select UniqueCarrier, colYear, colMonth, sum(Cancelled) as total_cancelled
from flights group by UniqueCarrier, colYear, colMonth, Cancelled 
having sum(Cancelled) > 0
order by total_cancelled desc;

-- ejercicio6
select TailNum, sum(Distance) as totalDistance
from flights
where TailNum != 'null'
group by TailNum 
order by totalDistance desc limit 10;

-- ejercicio 7
select UniqueCarrier, avg(ArrDelay) as avgDelay
from flights group by UniqueCarrier 
having avg(ArrDelay) > 10
order by avgDelay desc;