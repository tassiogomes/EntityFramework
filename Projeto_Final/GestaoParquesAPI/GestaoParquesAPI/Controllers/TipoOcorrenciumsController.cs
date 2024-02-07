using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using GestaoParquesAPI.Models;

namespace GestaoParquesAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TipoOcorrenciumsController : ControllerBase
    {
        private readonly GestaoParquesContext _context;

        public TipoOcorrenciumsController(GestaoParquesContext context)
        {
            _context = context;
        }

        // GET: api/TipoOcorrenciums
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TipoOcorrencium>>> GetTipoOcorrencia()
        {
            return await _context.TipoOcorrencia.ToListAsync();
        }

        // GET: api/TipoOcorrenciums/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TipoOcorrencium>> GetTipoOcorrencium(int id)
        {
            var tipoOcorrencium = await _context.TipoOcorrencia.FindAsync(id);

            if (tipoOcorrencium == null)
            {
                return NotFound();
            }

            return tipoOcorrencium;
        }

        // PUT: api/TipoOcorrenciums/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTipoOcorrencium(int id, TipoOcorrencium tipoOcorrencium)
        {
            if (id != tipoOcorrencium.IdTipoOcorrencia)
            {
                return BadRequest();
            }

            _context.Entry(tipoOcorrencium).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TipoOcorrenciumExists(id))
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

        // POST: api/TipoOcorrenciums
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TipoOcorrencium>> PostTipoOcorrencium(TipoOcorrencium tipoOcorrencium)
        {
            _context.TipoOcorrencia.Add(tipoOcorrencium);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTipoOcorrencium", new { id = tipoOcorrencium.IdTipoOcorrencia }, tipoOcorrencium);
        }

        // DELETE: api/TipoOcorrenciums/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTipoOcorrencium(int id)
        {
            var tipoOcorrencium = await _context.TipoOcorrencia.FindAsync(id);
            if (tipoOcorrencium == null)
            {
                return NotFound();
            }

            _context.TipoOcorrencia.Remove(tipoOcorrencium);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TipoOcorrenciumExists(int id)
        {
            return _context.TipoOcorrencia.Any(e => e.IdTipoOcorrencia == id);
        }
    }
}
