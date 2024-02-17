using Microsoft.AspNetCore.Mvc;
using XMDevBE.Entities;
using XMDevBE.Models;

namespace XMDevBE.Areas.admin.Controllers
{
    [Area("admin")]
    public class HomeController : Controller
    {
        private readonly IWebHostEnvironment _environment;
        private readonly AppDbContext _dbContext;
        public HomeController(IWebHostEnvironment environment, AppDbContext dbContext) {
            _environment = environment;
            _dbContext = dbContext;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult GetList()
        {
            var data = _dbContext.ProductEntities.
                Where(x => x.IsDeleted == false).ToList();
            return Ok(data);
        }
        public IActionResult AddPrd()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add([FromBody] Product model)
        {
            if(model.Id > 0)
            {
                var entity = _dbContext.ProductEntities.Find(model.Id);
                if(entity != null)
                {
                    entity.TenSP = model.TenSP;
                    entity.LoaiSP_Id = model.LoaiSP_Id;
                    entity.ThuongHieu_Id = model.ThuongHieu_Id;
                    entity.GiaBan = model.GiaBan;
                    entity.SoLuong = model.SoLuong;
                    entity.HinhAnh = model.HinhAnh;
                    entity.MoTa = model.MoTa;
                    _dbContext.ProductEntities.Update(entity);
                }
            } else
            {
                var entity = new ProductEntity() 
                {
                    
                    TenSP = model.TenSP,
                    LoaiSP_Id = model.LoaiSP_Id,
                    ThuongHieu_Id = model.ThuongHieu_Id,
                    GiaBan = model.GiaBan,
                    SoLuong = model.SoLuong,
                    HinhAnh = model.HinhAnh,
                    MoTa = model.MoTa,
                    IsActive = true
                };
                _dbContext.ProductEntities.Add(entity);
            }
            
            var status = _dbContext.SaveChanges();
            return Ok(status);
        }

        [HttpDelete]
        public IActionResult Delete(Product model)
        {
            var entity = _dbContext.ProductEntities.Find(model.Id);
            if(entity != null )
            {
                _dbContext.ProductEntities.Remove(entity);
            }
            var status = _dbContext.SaveChanges();
            return Ok(status);
        }

        [HttpGet]
        public IActionResult GetProductById(int id)
        {
            var data = _dbContext.ProductEntities
                .Where(x => x.Id == id).ToList();
            return Ok(data);
        }

        public IActionResult Edit()
        {
            return View();
        }
    }
}
