using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class Warehouse
{
    public string WarehouseId { get; set; } = null!;

    public string WarehouseName { get; set; } = null!;

    public string InsertUserId { get; set; } = null!;

    public DateTime InsertDateTime { get; set; }

    public string? LastModifiedUserId { get; set; }

    public DateTime? LastModifiedDateTime { get; set; }

    public virtual ICollection<Stock> Stocks { get; set; } = new List<Stock>();
}
