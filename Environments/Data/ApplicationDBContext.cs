using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Environments.Models;
using Microsoft.EntityFrameworkCore;

namespace Environments.Data
{
    public class ApplicationDBContext : DbContext
    {
        public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options) : base(options)
        {
        }

        public DbSet<EnvironmentStatus> EnvironmentStatus { get; set; }
        public DbSet<Stack> Stacks { get; set; }
        public DbSet<User> Users { get; set; }

    }
}
