SELECT
  State,
  CustomerId,
  FullName,
  TotalSpent,
  SpendRank
FROM (
  SELECT
    c.State AS State,
    c.CustomerId AS CustomerId,
    (c.FirstName || ' ' || c.LastName) AS FullName,
    ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS TotalSpent,
    RANK() OVER (
      PARTITION BY c.State
      ORDER BY SUM(ii.UnitPrice * ii.Quantity) DESC
    ) AS SpendRank
  FROM customers c
  JOIN invoices i ON c.CustomerId = i.CustomerId
  JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
  WHERE c.State IS NOT NULL
    AND c.FirstName IS NOT NULL
    AND c.LastName IS NOT NULL
    AND ii.UnitPrice IS NOT NULL
    AND ii.Quantity IS NOT NULL
  GROUP BY c.State, c.CustomerId, c.FirstName, c.LastName
) ranked
WHERE SpendRank <= 3
ORDER BY State ASC, SpendRank ASC, TotalSpent DESC;
