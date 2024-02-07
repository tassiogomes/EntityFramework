using StockManagement.api.Models;

namespace StockManagement.api.DTOs
{
    public class ProductDto
    {
        public string ProductId { get; set; } = null!;

        public string ProductName { get; set; } = null!;

        public string FamilyId { get; set; } = null!;

        public string FamilyName { get; set; } = null!;

        public string? Ean13code { get; set; }

        public string? Obs { get; set; }

        public ProductDto ModelToDto(Product model)
        {
            this.ProductId = model.ProductId;
            this.ProductName = model.ProductName;
            this.FamilyId = model.FamilyId;
            this.FamilyName = model.Family.FamilyName;
            this.Ean13code = model.Ean13code;
            this.Obs = model.Obs;
            //this.InsertDateTime = family.InsertDateTime;
            return this;
        }

        public Product DtoToModel()
        {
            return new Product
            {
                ProductId = this.ProductId,
                ProductName = this.ProductName,
                FamilyId = this.FamilyId,
                //Family = new Family
                //{
                //    FamilyId = this.FamilyId,
                //    FamilyName = this.FamilyName
                //},
                Ean13code = this.Ean13code,

                Obs = this.Obs
                
            };
        }
    }
}
