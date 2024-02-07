using Microsoft.EntityFrameworkCore;
using StockManagement.api.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddCors(o => o.AddPolicy(name: "MyAllowSpecifcOrigins",
                policy =>
                {
                    policy.WithOrigins("http://localhost:4200").AllowAnyHeader().AllowAnyMethod();
                }));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<StockManagementContext>(o => o.UseSqlServer(builder.Configuration.GetConnectionString("DBConnectionString")));

//builder.Services.AddCors(o => o.AddPolicy(name: "AllowAll",
//                policy =>
//                {
//                    policy.AllowAnyOrigin()
//                        .WithMethods("PUT", "DELETE", "GET", "POST");
//                }));
       
var app = builder.Build();



// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

//app.UseCors("AllowAll");
app.UseCors("MyAllowSpecifcOrigins");

app.Run();
