using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Security.Claims;
using XMDevBE.Entities;
using XMDevBE.Models;

namespace XMDevBE.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AppDbContext _dbcontext;

        public HomeController(ILogger<HomeController> logger, AppDbContext dbcontext)
        {
            _logger = logger;
            _dbcontext = dbcontext;
        }

        [Authorize]
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult GetList()
        {
            var data = _dbcontext.ProductEntities.
                Where(x => x.IsDeleted == false).ToList();
            return Ok(data);
        }
        public IActionResult GetUser() 
        {
            var dataUser = _dbcontext.UserEntities.ToList();
            return Ok(dataUser);
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public IActionResult AddUser([FromBody] User model)
        {
            var addU = new UserEntity() 
            {
                TenDN = model.TenDN,
                MatKhau = model.MatKhau,
                HoTen = model.HoTen,
            };
            _dbcontext.UserEntities.Add(addU);
            var status = _dbcontext.SaveChanges();
            return Ok(status);
        }

        [HttpDelete]
        public IActionResult DeleteUser(User model)
        {
            var entity = _dbcontext.UserEntities.Find(model.Id);
            if (entity != null)
            {
                _dbcontext.UserEntities.Remove(entity);
            }
            var status = _dbcontext.SaveChanges();
            return Ok(status);
        }

        [HttpGet]
        public IActionResult GetProductById(int id)
        {
            var data = _dbcontext.ProductEntities
                .Where(x => x.Id == id).ToList();
            return Ok(data);
        }
        public IActionResult TrangChu()
        {
            return View();
        }
        public IActionResult CreateAccount()
        {
            return View();
        }
        public IActionResult ChiTietSP()
        {
            return View();
        }
        public IActionResult GioiThieu()
        {
            return View();
        }
        public IActionResult SanPham()
        {
            return View();
        }
        public IActionResult TinTuc()
        {
            return View();
        }
        public IActionResult DoiTac()
        {
            return View();
        }
        public IActionResult LienHe()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}