using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class GetWarehouse
{
    public string WarehouseId { get; set; } = null!;

    public string WarehouseName { get; set; } = null!;
}
