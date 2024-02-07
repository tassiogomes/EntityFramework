using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class GetProduct
{
    public string ProductId { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public string FamilyId { get; set; } = null!;

    public string? Ean13code { get; set; }

    public string? Obs { get; set; }
}
