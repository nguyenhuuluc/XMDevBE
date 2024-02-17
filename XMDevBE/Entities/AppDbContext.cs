using Microsoft.EntityFrameworkCore;

namespace XMDevBE.Entities
{
    public class AppDbContext:DbContext
    {
        public AppDbContext()
        {
        }

        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
            
        }
        public DbSet<ProductEntity> ProductEntities { get; set; }
        public DbSet<UserEntity>  UserEntities { get; set; }  
    }
}
