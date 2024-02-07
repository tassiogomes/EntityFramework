using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class StocksDetail
{
    public string DocumentType { get; set; } = null!;

    public long DocumentNumber { get; set; }

    public short DocumentLineNumber { get; set; }

    public string WarehouseId { get; set; } = null!;

    public string ProductId { get; set; } = null!;

    public decimal Quantity { get; set; }

    public decimal InitValue { get; set; }

    public decimal? TotalLineValue { get; set; }

    public string InsertUserId { get; set; } = null!;

    public DateTime InsertDateTime { get; set; }

    public string? LastModifiedUserId { get; set; }

    public DateTime? LastModifiedDateTime { get; set; }

    public virtual StocksHeader StocksHeader { get; set; } = null!;
}
