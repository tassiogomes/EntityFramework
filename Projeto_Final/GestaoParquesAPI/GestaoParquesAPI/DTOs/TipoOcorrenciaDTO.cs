using GestaoParquesAPI.Models;

namespace GestaoParquesAPI.DTOs
{
    public class TipoOcorrenciaDTO
    {
        public int IdTipoOcorrencia { get; set; }

        public string NomeTipoOcorrencia { get; set; } = null!;

        public DateTime DataCriacao { get; set; }

        public DateTime DataAtualizacao { get; set; }

        public bool Inativo { get; set; }

        public virtual ICollection<Ocorrencium> Ocorrencia { get; set; } = new List<Ocorrencium>();

    }
}
