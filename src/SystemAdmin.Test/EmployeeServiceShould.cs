using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;
using System.Diagnostics.CodeAnalysis;
using System.Threading.Tasks;
using SystemAdmin.Common.Models;
using SystemAdmin.Repo.Repository;
using SystemAdmin.Services.Interfaces;
using SystemAdmin.Services.Services;
using SystemAdmin.Test.MockRepository;
using SystemAdmin.Test.Stubs;

namespace SystemAdmin.Test
{
    [TestClass]
    [ExcludeFromCodeCoverage]

    public class EmployeeServiceShould
    {
        private static IEmployeeService _employeeService;
        private static Mock<IUnitOfWork> _unitOfWork;

        [ClassInitialize()]
        public static void Setup(TestContext context)
        {

            Mock<IEmployeeRepository> _employeeRepository = new EmployeeRepositoryMock()._employeeRepository;
            _unitOfWork = new Mock<IUnitOfWork>();
            _unitOfWork.Setup(sp => sp.EmployeeRepository).Returns(_employeeRepository.Object);
            _employeeService = new EmployeeService(_unitOfWork.Object);
        }

        [TestMethod]
        public async Task AddAsync_WithValidEmployee()
        {
            //Arrange
            Employee employee = EmployeeStub.employee1;
            //Act
            var result = await _employeeService.AddAsync(employee);
            //Assert
            Assert.AreEqual(employee, result);
        }

        [TestMethod]
        public async Task AddAsync_WithEmployeeIsEmptyOrNull_ShouldThrowExceptionMessage()
        {
            //Arrange
            Employee employee = null;
            //Act
            try
            {
                await _employeeService.AddAsync(employee);
            }
            catch (Exception e)
            {
                StringAssert.Contains(e.Message, "Entity is null");
                return;
            }
            //Assert
            Assert.Fail("The excepted exception was not thrown");
        }

        [TestMethod]
        [ExpectedException(typeof(DbUpdateException))]
        public async Task AddAsync_WithEmployeeIsEmptyOrNull_ShouldThrowDbUpdateException()
        {
            //Arrange
            Employee employee = null;

            //Act
            await  _employeeService.AddAsync(employee);
            
        }

        [TestMethod]
        public async Task GetAllAsync_ShouldReturnListEmployee()
        {
            //Arrange
            var expect = EmployeeStub.employees;
            //Act
            var actual = await _employeeService.GetAllAsync();
            //Assert
            Assert.AreEqual(expect, actual);
        }

        [TestMethod]
        public async Task GetByIdAsync_ShouldReturnEmployee()
        {
            //Arrange
            Guid Id = Guid.Parse("6863a690-904e-4662-a1aa-3f5065f04b2b");
            var expect = EmployeeStub.employee1;
            //Act
            var actual = await _employeeService.GetByIdAsync(Id);
            //Assert
            Assert.AreEqual(expect, actual);
        }

        //[TestMethod]
        //public async Task GetByIdentificationAsync_ShouldReturnEmployee()
        //{
        //    //Arrange
        //    string Identification = "78546321";
        //    var expect = EmployeeStub.employee2;
        //    //Act
        //    var actual = await _employeeService.GetByIdentificationAsync(Identification);
        //    //Assert
        //    Assert.AreEqual(expect, actual);
        //}

        [TestMethod]
        public async Task GetByIdentificationAsync_WithIdentificationEmptyShouldReturnNullEmployee()
        {
            //Arrange
            string Identification = "";
            //Act
            var actual = await _employeeService.GetByIdentificationAsync(Identification);
            //Assert
            Assert.IsNull(actual);
        }

        [TestMethod]
        public async Task UpdateAsync_WithValidEmployee()
        {
            //Arrange
            Employee employee = EmployeeStub.employee1;
            //Act
            var result = await _employeeService.UpdateAsync(employee);
            //Assert
            Assert.AreEqual(employee, result);
        }
    }
}
