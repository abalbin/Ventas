namespace VentasApp.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;
    using System.Web.Security;
    using WebMatrix.WebData;

    internal sealed class Configuration : DbMigrationsConfiguration<VentasApp.Models.UsersContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(VentasApp.Models.UsersContext context)
        {
            WebSecurity.InitializeDatabaseConnection(
               "DefaultConnection",
               "UserProfile",
               "UserId",
               "UserName", autoCreateTables: true);

            if (!Roles.RoleExists("Administrador"))
                Roles.CreateRole("Administrador");

            if (!WebSecurity.UserExists("abalbin"))
                WebSecurity.CreateUserAndAccount(
                    "abalbin",
                    "123456",
                    new { FirstName = "Arturo", LastName = "Balbin" });
            if (!Roles.GetRolesForUser("abalbin").Contains("Administrador"))
                Roles.AddUsersToRoles(new[] { "abalbin" }, new[] { "Administrador" });
        }
    }
}
