using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Environments.Models
{
    public class EnvironmentStatus
    {
        public int Id { get; set; }
        public string  EnvironmentName { get; set; }
        public string Credentials { get; set; }
        public string EmployeeName { get; set; }
        public Stack Stack { get; set; }
        public string IsBusy { get; set; }
        public List<Stack> EnvIsApplicableFor { get; set; }
        public string Notes { get; set; }
    }
}
