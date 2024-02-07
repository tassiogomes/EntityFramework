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
    public class ProductsController : ControllerBase
    {
        private readonly StockManagementContext _context;

        public ProductsController(StockManagementContext context)
        {
            _context = context;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductDto>>> GetProducts()
        {
            List<ProductDto> result = new List<ProductDto>();

            var products = await _context.Products.Include(p => p.Family).ToListAsync();

            foreach (var product in products)
            {
                result.Add(new ProductDto().ModelToDto(product));
            }

            return Ok(result);
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductDto>> GetProduct(string id)
        {
            var product = await _context.Products.Include(p => p.Family).FirstOrDefaultAsync(p=>p.ProductId == id);

            if (product == null)
            {
                return NotFound();
            }

            return Ok(new ProductDto().ModelToDto(product));
        }

        // PUT: api/Products/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduct(string id, ProductDto product)
        {
            Product productModel;
            if (id != product.ProductId)
            {
                return BadRequest();
            }

            productModel = await _context.Products.FindAsync(id);

            if (productModel == null)
            {
                return BadRequest();
            }

            productModel.ProductName = product.ProductName;
            productModel.Ean13code = product.Ean13code;
            productModel.Obs=product.Obs;
            productModel.FamilyId = product.FamilyId;
            productModel.LastModifiedDateTime = DateTime.Now;
            productModel.LastModifiedUserId = productModel.InsertUserId;

            _context.Entry(productModel).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
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

        // POST: api/Products
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Product>> PostProduct(ProductDto product)
        {

            _context.Products.Add(product.DtoToModel());
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (ProductExists(product.ProductId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetProduct", new { id = product.ProductId }, product);
        }

        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteProduct(string id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }



            _context.Products.Remove(product);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ProductExists(string id)
        {
            return _context.Products.Any(e => e.ProductId == id);
        }
    }
}
