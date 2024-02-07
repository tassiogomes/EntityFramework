import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { ProductsComponent } from './products/products.component';
import { CustomersComponent } from './customers/customers.component';

const routes: Routes = [
  {path: "products", component: ProductsComponent},
  {path: "customers", component: CustomersComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes), FormsModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
