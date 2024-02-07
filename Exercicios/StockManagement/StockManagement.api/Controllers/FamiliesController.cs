using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using StockManagement.api.DTOs;
using StockManagement.api.Models;

namespace StockManagement.api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FamiliesController : ControllerBase
    {
        private readonly StockManagementContext _context;

        public FamiliesController(StockManagementContext context)
        {
            _context = context;
        }

        // GET: api/Families
        [HttpGet]
        public async Task<ActionResult<IEnumerable<FamilyDto>>> GetFamilies()
        {
            List<FamilyDto> listResult = new List<FamilyDto>();
            var families = await _context.Families.ToListAsync();

            foreach (var item in families)
            {
                listResult.Add(new FamilyDto().ModelToDto(item));
            }

            return Ok(listResult);
        }

        // GET: api/Families/5
        [HttpGet("{id}")]
        public async Task<ActionResult<FamilyDto>> GetFamily(string id)
        {
            var family = await _context.Families.FindAsync(id);

            if (family == null)
            {
                return NotFound();
            }


            return Ok(new FamilyDto().ModelToDto(family));
        }

        // PUT: api/Families/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFamily(string id, FamilyDto family)
        {
            Family familyModel;

            
            if (id != family.FamilyId)
            {
                return BadRequest();
            }

            familyModel = await _context.Families.FindAsync(family.FamilyId);

            if (familyModel == null)
            {
                return BadRequest();
            }

            familyModel.FamilyName = family.FamilyName;
            familyModel.LastModifiedDateTime = DateTime.Now;
            familyModel.LastModifiedUserId = familyModel.InsertUserId;


            _context.Entry(familyModel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FamilyExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Families
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<FamilyDto>> PostFamily(FamilyDto family)
        {
            Family familyModel = family.DtoToModel() as Family;

            _context.Families.Add(familyModel);

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (FamilyExists(family.FamilyId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetFamily", new { id = family.FamilyId }, family);
        }

        // DELETE: api/Families/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFamily(string id)
        {
            var family = await _context.Families.FindAsync(id);
            if (family == null)
            {
                return NotFound();
            }

            _context.Families.Remove(family);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool FamilyExists(string id)
        {
            return _context.Families.Any(e => e.FamilyId == id);
        }
    }
}
