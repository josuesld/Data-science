# 📊 Northwind MySQL Reporting Pipeline

Este proyecto muestra cómo extraer datos de la base de datos Northwind en MySQL, procesarlos con Python y exportarlos a Excel.

## 🚀 Flujo de Trabajo

A continuación se describe el flujo completo:

1. **Base de Datos**
   - Utilizamos **Northwind** cargada en MySQL.
   - Las tablas principales son:
     - `customers`
     - `orders`
     - `orderdetails`
     - `products`

2. **Consultas SQL**
   - Se definieron 3 consultas principales:
     - **Consulta 1**: Ventas totales por cliente.
     - **Consulta 2**: Ventas totales por producto.
     - **Consulta 3**: Ventas totales por país.

   - Ejemplo de Consulta 3:
     ```sql
     SELECT
         c.Country AS country,
         SUM(od.Quantity * p.Price) AS total_sales
     FROM customers c
     JOIN orders o ON c.CustomerID = o.CustomerID
     JOIN orderdetails od ON o.OrderID = od.OrderID
     JOIN products p ON od.ProductID = p.ProductID
     GROUP BY c.Country
     ORDER BY total_sales DESC;
     ```

3. **Python**
   - Usamos **SQLAlchemy** y **pandas** para conectarnos a MySQL y procesar los datos.
   - El flujo básico en el script:
     - Conectar a la base de datos con SQLAlchemy.
     - Ejecutar la consulta SQL.
     - Cargar los resultados en un DataFrame de pandas.
     - Exportar el DataFrame a un archivo Excel.

4. **Variables de Entorno**
   - Para mayor seguridad y flexibilidad, las credenciales de la base de datos se almacenan en un archivo `.env`:
     ```
     DB_USER=tu_usuario
     DB_PASSWORD=tu_contraseña
     DB_HOST=localhost
     DB_PORT=3306
     DB_DATABASE=northwind
     EXPORT_PATH=J:\DISCO J\S+Q+L\consultas readme
     ```

5. **Exportación a Excel**
   - Los resultados de cada consulta se exportan en un Excel separado.
   - Por ejemplo:
     - `sells_por_pais.xlsx` contiene la Consulta 3.


## ⚙️ Dependencias

Instalar las librerías necesarias:

```bash
pip install pandas SQLAlchemy PyMySQL python-dotenv
