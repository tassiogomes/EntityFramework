using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class Family
{
    public string FamilyId { get; set; } = null!;

    public string FamilyName { get; set; } = null!;

    public string? InsertUserId { get; set; } = null!;

    public DateTime? InsertDateTime { get; set; }

    public string? LastModifiedUserId { get; set; }

    public DateTime? LastModifiedDateTime { get; set; }

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
