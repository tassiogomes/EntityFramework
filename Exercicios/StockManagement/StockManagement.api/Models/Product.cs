using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class Product
{
    public string ProductId { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public string FamilyId { get; set; } = null!;

    public string? Ean13code { get; set; }

    public string? Obs { get; set; }

    public string? InsertUserId { get; set; } = null!;

    public DateTime? InsertDateTime { get; set; }

    public string? LastModifiedUserId { get; set; }

    public DateTime? LastModifiedDateTime { get; set; }

    public virtual Family Family { get; set; } = null!;

    public virtual ICollection<Stock> Stocks { get; set; } = new List<Stock>();
}
