using StockManagement.api.Models;

namespace StockManagement.api.DTOs
{
    public class FamilyDto
    {
        public string FamilyId { get; set; } = null!;

        public string FamilyName { get; set; } = null!;

        //public DateTime? InsertDateTime { get; set; } = null!;

        public FamilyDto ModelToDto(Family family)
        {
            this.FamilyId = family.FamilyId;
            this.FamilyName = family.FamilyName;
            //this.InsertDateTime = family.InsertDateTime;
            return this;
        }

        public Family DtoToModel()
        {
            return new Family
            {
                FamilyId = this.FamilyId,
                FamilyName = this.FamilyName
            };
        }
    }
}
