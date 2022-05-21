using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Environments.Models
{
    public class EnvironmentStatus
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [DisplayName("Environment Name")]
        public string  EnvironmentName { get; set; }
        [Required]
        public string Credentials { get; set; }
        public string EmployeeName { get; set; }
        public string Stack { get; set; }
        public string IsBusy { get; set; }
        public string EnvIsApplicableFor { get; set; }
        public string Notes { get; set; }
    }
}
