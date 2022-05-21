using Microsoft.EntityFrameworkCore.Migrations;

namespace Environments.Migrations
{
    public partial class addedEnvironmentStatus : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_EnvironmentStatus_Stacks_StackId",
                table: "EnvironmentStatus");

            migrationBuilder.DropForeignKey(
                name: "FK_Stacks_EnvironmentStatus_EnvironmentStatusId",
                table: "Stacks");

            migrationBuilder.DropIndex(
                name: "IX_Stacks_EnvironmentStatusId",
                table: "Stacks");

            migrationBuilder.DropIndex(
                name: "IX_EnvironmentStatus_StackId",
                table: "EnvironmentStatus");

            migrationBuilder.DropColumn(
                name: "EnvironmentStatusId",
                table: "Stacks");

            migrationBuilder.DropColumn(
                name: "StackId",
                table: "EnvironmentStatus");

            migrationBuilder.AddColumn<string>(
                name: "EnvIsApplicableFor",
                table: "EnvironmentStatus",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Stack",
                table: "EnvironmentStatus",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EnvIsApplicableFor",
                table: "EnvironmentStatus");

            migrationBuilder.DropColumn(
                name: "Stack",
                table: "EnvironmentStatus");

            migrationBuilder.AddColumn<int>(
                name: "EnvironmentStatusId",
                table: "Stacks",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "StackId",
                table: "EnvironmentStatus",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Stacks_EnvironmentStatusId",
                table: "Stacks",
                column: "EnvironmentStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_EnvironmentStatus_StackId",
                table: "EnvironmentStatus",
                column: "StackId");

            migrationBuilder.AddForeignKey(
                name: "FK_EnvironmentStatus_Stacks_StackId",
                table: "EnvironmentStatus",
                column: "StackId",
                principalTable: "Stacks",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);

            migrationBuilder.AddForeignKey(
                name: "FK_Stacks_EnvironmentStatus_EnvironmentStatusId",
                table: "Stacks",
                column: "EnvironmentStatusId",
                principalTable: "EnvironmentStatus",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
