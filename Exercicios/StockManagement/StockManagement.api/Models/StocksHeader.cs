using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class StocksHeader
{
    public string DocumentType { get; set; } = null!;

    public long DocumentNumber { get; set; }

    public DateOnly DocumentDate { get; set; }

    public string InsertUserId { get; set; } = null!;

    public DateTime InsertDateTime { get; set; }

    public string? LastModifiedUserId { get; set; }

    public DateTime? LastModifiedDateTime { get; set; }

    public virtual ICollection<StocksDetail> StocksDetails { get; set; } = new List<StocksDetail>();
}
