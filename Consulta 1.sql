-- 1️⃣ Mostrar todas las bases de datos disponibles en el servidor
SHOW DATABASES;

-- 2️⃣ Seleccionar la base de datos northwind para trabajar con ella
USE northwind;

-- 3️⃣ Mostrar todas las tablas dentro de la base de datos seleccionada
SHOW TABLES;

-- 4️⃣ Ver todas las filas y columnas de la tabla 'categories'
SELECT * FROM categories;

#⭐ 📌 OBJETIVO HOY
#✅ Escribir las consultas SQL que preparan los datos finales.
#✅ Guardarlas todas en un archivo .sql bien comentado para tu repositorio.
#✅ Exportar sus resultados a CSV o Excel (para Power BI).

#✅ 1️⃣ Preguntas de negocio
#Vamos a responder estas 5 preguntas clave para el dashboard:
#1️⃣ ¿Cuáles son los productos más vendidos?
#2️⃣ ¿Qué clientes compran más?
#3️⃣ ¿Cuáles son las ventas totales por país?
#4️⃣ ¿Quiénes son los mejores empleados (vendedores) por ventas?
#5️⃣ Evolución de ventas por mes.

-- Consulta 1: Productos más vendidos (por cantidad total)
-- Objetivo: Obtener la lista de productos ordenados por la cantidad total vendida, de mayor a menor.

SELECT 
    p.product_id,         -- ID único del producto
    p.product_name,       -- Nombre del producto
    SUM(od.quantity) AS total_quantity  -- Suma total de las unidades vendidas de ese producto
FROM order_details od
JOIN products p 
    ON od.product_id = p.product_id   -- Unimos detalles del pedido con la tabla de productos para obtener el nombre
GROUP BY 
    p.product_id,         -- Agrupamos por ID del producto
    p.product_name         -- y nombre del producto
ORDER BY 
    total_quantity DESC;   -- Ordenamos de mayor a menor cantidad vendida

#👉 Resultado:
#Lista de productos con la suma total de unidades vendidas.
#Ordenada para mostrar los más vendidos primero.









