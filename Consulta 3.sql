-- 1️⃣ Mostrar todas las bases de datos disponibles en el servidor
SHOW DATABASES;

-- 2️⃣ Seleccionar la base de datos northwind para trabajar con ella
USE northwind;

-- 3️⃣ Mostrar todas las tablas dentro de la base de datos seleccionada
SHOW TABLES;

-- Consulta 3: Ventas totales por país
-- Objetivo: Calcular el monto total vendido agrupado por país del cliente

SELECT
    c.Country,                             -- País del cliente
    SUM(od.Quantity * p.Price) AS total_sales  -- Cálculo del monto total vendido (cantidad * precio)
FROM customers c
JOIN orders o 
    ON c.CustomerID = o.CustomerID             -- Vincula pedidos al cliente
JOIN orderdetails od 
    ON o.OrderID = od.OrderID                  -- Vincula detalles del pedido
JOIN products p
    ON od.ProductID = p.ProductID              -- Vincula producto para obtener precio
GROUP BY
    c.Country                                  -- Agrupa resultados por país
ORDER BY
    total_sales DESC;                          -- Ordena de mayor a menor venta

-- 👉 Resultado:
-- Lista de países con el monto total de ventas.
-- Ordenada para mostrar primero los países con más ventas.


