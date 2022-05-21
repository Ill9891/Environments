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

        //POST - CREATE
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(EnvironmentStatus obj)
        {
            if (ModelState.IsValid)
            {
                _db.EnvironmentStatus.Add(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(obj);
        }

        //GET - EDIT
        public IActionResult Edit(int? id)
        {
            if (id == null || id == 0)
                return NotFound();

            var obj = _db.EnvironmentStatus.Find(id);

            if (obj == null)
                return NotFound();

            return View(obj);
        }

        //POST - EDIT
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(EnvironmentStatus obj)
        {
            if (ModelState.IsValid)
            {
                _db.EnvironmentStatus.Update(obj);
                _db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(obj);
        }

        //GET - DELETE
        public IActionResult Delete(int? id)
        {
            if (id == null || id == 0)
                return NotFound();

            var obj = _db.EnvironmentStatus.Find(id);

            if (obj == null)
                return NotFound();

            return View(obj);
        }

        //POST - Delete
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult DeletePost(int? id)
        {
            var obj = _db.EnvironmentStatus.Find(id);

            if (obj == null)
                NotFound();

            _db.EnvironmentStatus.Remove(obj);
            _db.SaveChanges();
            return RedirectToAction("Index");

            return View(obj);
        }
    }
}
