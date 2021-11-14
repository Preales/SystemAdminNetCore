using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;

namespace SystemAdmin.xUnit.Test.Stubs
{
    public static class EmployeeStub
    {
        public static Employee employee1 = new()
        {
            Id = Guid.Parse("6863a690-904e-4662-a1aa-3f5065f04b2b"),
            Name = "Maria",
            LastName = "Camila",
            Identification = "4551144",
            Charge = "Abogado"
        };

        public static Employee employee2 = new()
        {
            Id = Guid.Parse("8963a690-904e-4662-a1aa-3f5065f04b4d"),
            Name = "Martha",
            LastName = "Carmona",
            Identification = "78546321",
            Charge = "Contador"
        };

        public static IEnumerable<Employee> employees = new List<Employee>(new Employee[] { employee1, employee2 });

    }
}
