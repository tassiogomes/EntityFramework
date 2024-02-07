using System;
using System.Collections.Generic;

namespace StockManagement.api.Models;

public partial class GetFamily
{
    public string FamilyId { get; set; } = null!;

    public string FamilyName { get; set; } = null!;
}
