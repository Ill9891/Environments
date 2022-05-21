using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Environments.Data;
using Environments.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.Extensions.Configuration;

namespace Environments.Controllers
{
    public class EnvironmentStatusController : Controller
    {
        private readonly ApplicationDBContext _db;

        public EnvironmentStatusController(ApplicationDBContext db)
        {
            _db = db;
        }

        public IActionResult Index()
        {
            IEnumerable<EnvironmentStatus> objList = _db.EnvironmentStatus;
            return View(objList);
        }

        //GET - CREATE
        public IActionResult Create()
        {
            return View();
        }

        //PUT - CREATE
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(EnvironmentStatus obj)
        {
            _db.EnvironmentStatus.Update(obj);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
