using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class Stock
{
    public string ProductId { get; set; } = null!;

    public string WarehouseId { get; set; } = null!;

    public decimal StockAvailable { get; set; }

    public string InsertUserId { get; set; } = null!;

    public DateTime InsertDateTime { get; set; }

    public string? LastModifiedUserId { get; set; }

    public DateTime? LastModifiedDateTime { get; set; }

    public virtual Product Product { get; set; } = null!;

    public virtual Warehouse Warehouse { get; set; } = null!;
}
