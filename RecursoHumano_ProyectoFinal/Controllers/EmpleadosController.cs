using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using RecursoHumano_ProyectoFinal.Models;

namespace RecursoHumano_ProyectoFinal.Controllers
{
    public class EmpleadosController : Controller
    {
        private RecursoHumanoContainer db = new RecursoHumanoContainer();
        public ActionResult Activos(string searching)
        {
            var empleados = db.Empleados.Include(e => e.Departamento).Include(e => e.Cargo);
            return View(empleados.Where(x => x.Nombre.Contains(searching) || searching == null).ToList());
        }

        public ActionResult Inactivos(string searching)
        {
            var empleados = db.Empleados.Include(e => e.Departamento).Include(e => e.Cargo);
            return View(empleados.Where(x => x.Nombre.Contains(searching) || searching == null).ToList());
        }

        // GET: Empleados
        public ActionResult Index()
        {
            var empleados = db.Empleados.Include(e => e.Departamento).Include(e => e.Cargo);
            return View(empleados.ToList());
        }

        public ActionResult Procesos()
        {
            var empleados = db.Empleados.Include(e => e.Departamento).Include(e => e.Cargo);
            return View(empleados.ToList());
        }

        // GET: Empleados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleados empleados = db.Empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            return View(empleados);
        }

        // GET: Empleados/Create
        public ActionResult Create()
        {
            ViewBag.DepartamentosId = new SelectList(db.Departamentos, "Id", "Nombre");
            ViewBag.CargosId = new SelectList(db.Cargos, "Id", "Cargo");
            return View();
        }

        // POST: Empleados/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Codigo_Empleado,Nombre,Apellido,Telefono,Fecha_Ingreso,Salario,Estatus,DepartamentosId,CargosId")] Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Empleados.Add(empleados);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.DepartamentosId = new SelectList(db.Departamentos, "Id", "Nombre", empleados.DepartamentosId);
            ViewBag.CargosId = new SelectList(db.Cargos, "Id", "Cargo", empleados.CargosId);
            return View(empleados);
        }

        // GET: Empleados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleados empleados = db.Empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            ViewBag.DepartamentosId = new SelectList(db.Departamentos, "Id", "Nombre", empleados.DepartamentosId);
            ViewBag.CargosId = new SelectList(db.Cargos, "Id", "Cargo", empleados.CargosId);
            return View(empleados);
        }

        // POST: Empleados/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Codigo_Empleado,Nombre,Apellido,Telefono,Fecha_Ingreso,Salario,Estatus,DepartamentosId,CargosId")] Empleados empleados)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleados).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.DepartamentosId = new SelectList(db.Departamentos, "Id", "Nombre", empleados.DepartamentosId);
            ViewBag.CargosId = new SelectList(db.Cargos, "Id", "Cargo", empleados.CargosId);
            return View(empleados);
        }

        // GET: Empleados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleados empleados = db.Empleados.Find(id);
            if (empleados == null)
            {
                return HttpNotFound();
            }
            return View(empleados);
        }

        // POST: Empleados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Empleados empleados = db.Empleados.Find(id);
            db.Empleados.Remove(empleados);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
