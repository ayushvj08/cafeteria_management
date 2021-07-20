# Hello!🖐 Welome to [HotCafe.com](https://hot-cafe.herokuapp.com/)

![Screenshot (245)](https://user-images.githubusercontent.com/56788911/126221698-1b4b4a4f-3e64-47b4-916c-c9211c31dcff.png)

I am Ayush Vijayant and this is my project , a Cafeteria Management System built on Rails which supports multiple users and roles like admin, customer, and billing-clerk.

Here different Users get different views of the application, depending upon the roles assigned to them : [ "admin" , "cusomer" , "billing clerk "].

> ![Screenshot (246)](https://user-images.githubusercontent.com/56788911/126222293-e2ea492f-e37a-4e34-897c-5deeed1c48c6.png)

> ![Screenshot (252)](https://user-images.githubusercontent.com/56788911/126222485-6a71db1d-28d1-489f-a18b-e6c6faf1a183.png)

> There are three personas in this Cafeteria system:

- Cafeteria Owner: the owner has complete access of the system. They can add and update stock, create invoices, see all reports, mark orders as delivered and so on.
- Online Customer: A customer can place an order online and can see a menu from which they can place an order. They can also see the invoice details and status of their order, but they do not see anything else about the system.
- Cafeteria Billing Clerk: The billing clerk is the person taking customer orders directly from the counter. They can create new invoices, print them, and see order status. However they are not be able to modify item details or see reports like income since they sholud be only seen by the owner.

> ![Screenshot (248)](https://user-images.githubusercontent.com/56788911/126222725-02acfed3-439c-451e-8e34-434877552a07.png) > ![Screenshot (247)](https://user-images.githubusercontent.com/56788911/126222828-def29b3b-ff9f-46fb-8bbc-ec1a3b3f84b2.png)

## More Insights into the different personas

### Customer

- Customer are able to Sign-up
- Customer can see the menu and add items to cart
- Customer can see the cart while ordering

### Cafeteria Billing Clerk

Billing clerks can only sign-in and sign-out. They cannot sign-up by themselves. Their accounts are created only by the owner.

- Clerk can mark orders as delivered : They can see the list of all pending orders from the queue of orders. They can also mark orders as “delivered”.
- Clerk can create orders for offline customers.

### Cafeteria Owner

Nobody can sign-up as an owner. Instead, the live application comes with an owner already created. An owner can create other owners.

- Owner can manage the menu
- Owner can see reports such as : Sale Reports for any given date range , see details of a single invoice , apply filter on orders to list orders during a particular time period.
- Owner can manage users : They can see the list of all users - customers, billing-clerks, and other owners.
- They can create and update billing clerks and owners.

> ![Screenshot (251)](https://user-images.githubusercontent.com/56788911/126222988-75c75bf3-ecb4-4d3a-b27e-e52b2b73e86b.png)
