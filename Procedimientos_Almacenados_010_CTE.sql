/*
Funciones de Ventana

SUM(): Calcula la suma de un conjunto de valores.
AVG(): Calcula el promedio de un conjunto de valores.
MIN(), MAX(): Encuentra el valor mínimo o máximo en un conjunto de valores.

Funciones de Clasificacion y Particion

ROW_NUMBER(): Asigna un número a cada fila en función del orden especificado.
RANK(), DENSE_RANK(): Asigna una clasificación a cada fila dentro de un conjunto de resultados.
NTILE(): Divide un conjunto de datos en un número especificado de particiones.

Funciones de Desplazamiento

LEAD()
LAG()

CTE(Common Table Expression)
*/

WITH VentasDiarias AS (
  SELECT
    OD.ProductID,
	O.OrderDate,
	COALESCE(SUM(OD.UnitPrice * OD.Quantity),0) AS VentasDiarias
    FROM ORDERS O 
	JOIN 
    [Order Details] OD
	ON O.OrderID=OD.OrderID
	GROUP BY OD.ProductID,O.OrderDate
),
VentasConPromedioMovil AS (
  SELECT
    ProductID,
	OrderDate,
	VentasDiarias,
	AVG(VentasDiarias) OVER (PARTITION BY ProductID ORDER BY OrderDate ROWS
	--Incluye un rango especifico de filas
	--n PRECEDIN :Representa el # de filas anteriores a la actual
	--CURRENT ROW:indica la fila actual
	BETWEEN 6 PRECEDING AND CURRENT ROW) AS PromedioMovil
  FROM VentasDiarias 
)
Select
  ProductID,
  OrderDate,
  VentasDiarias,
  PromedioMovil
  FROM VentasConPromedioMovil
  ORDER BY ProductID,OrderDate;


/*

SELECT
 FECHA,
 VALOR
 SUM(VALOR) OVER(ORDER BY Fecha ROWS BETWEEN 6 PRECEDING AND CURRENT ROW)
FROM MITABLA

/*

