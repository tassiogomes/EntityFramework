using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class GetProductsStock
{
    public string ProductId { get; set; } = null!;

    public string ProductName { get; set; } = null!;

    public decimal? Stock { get; set; }
}
