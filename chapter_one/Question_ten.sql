use cape_codd;

select SKU, SKU_Description,WarehouseID from inventory where QuantityOnHand > 0 order by WarehouseID desc,SKU asc 