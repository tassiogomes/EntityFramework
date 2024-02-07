using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class GetProductsStockByWarehouse
{
    public string ProductName { get; set; } = null!;

    public string WarehouseName { get; set; } = null!;

    public decimal StockAvailable { get; set; }
}
