using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;
using System.Data.SqlClient;
using ClassLibrary;

namespace TestingCustomer
{
    [TestClass]
    public class Customers
    {
        string firstName = "Sadiqul Islam";
        string lastName = "Nayeem";
        string email = "sadiq.nayeem28@gmail.com";
        string phone = "07513200344";
        string address = "17 High Street";
        string password = "1234";

        [TestMethod]
        public void CustomerIDNoOK()
        {
            Customer ACustomer = new Customer();
            Int32 TestData = 1;
            ACustomer.CustomerID = TestData;
            Assert.AreEqual(ACustomer.CustomerID, TestData);
        }

        [TestMethod]
        public void FirstNameOK()
        {
            Customer ACustomer = new Customer();
            string TestData = "Sadiqul Islam";
            ACustomer.FirstName = TestData;
            Assert.AreEqual(ACustomer.FirstName, TestData);
        }

        [TestMethod]
        public void LastNameOK()
        {
            Customer ACustomer = new Customer();
            string TestData = "Nayeem";
            ACustomer.LastName = TestData;
            Assert.AreEqual(ACustomer.LastName, TestData);
        }

        [TestMethod]
        public void EmailOK()
        {
            Customer ACustomer = new Customer();
            string TestData = "sadiq.nayeem28@gmail.com";
            ACustomer.Email = TestData;
            Assert.AreEqual(ACustomer.Email, TestData);
        }

        [TestMethod]
        public void PhoneOK()
        {
            Customer ACustomer = new Customer();
            string TestData = "07513200344";
            ACustomer.Phone = TestData;
            Assert.AreEqual(ACustomer.Phone, TestData);
        }

        [TestMethod]
        public void AddressOK()
        {
            Customer ACustomer = new Customer();
            string TestData = "17 High Street";
            ACustomer.Address = TestData;
            Assert.AreEqual(ACustomer.Address, TestData);
        }

        [TestMethod]
        public void PasswordOK()
        {
            Customer ACustomer = new Customer();
            string TestData = "1234";
            ACustomer.Password = TestData;
            Assert.AreEqual(ACustomer.Password, TestData);
        }

        [TestMethod]
        public void InstanceOK()
        {
            Customer ACustomer = new Customer();
            Assert.IsNotNull(ACustomer);
        }
    }
}
