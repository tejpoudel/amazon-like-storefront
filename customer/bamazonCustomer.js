var Table = require('cli-table');

var inquirer = require('inquirer');

var mysql      = require('mysql');


var connection = mysql.createConnection({
  host: "localhost",
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "developer1",
  database: "bamazon_DB"
});

connection.connect(function(err) {
  if (err) throw err;
  openForPurchases();
});

// function which displays the store contents and prompts the user to enter what they want to purchase
function openForPurchases() {

 // sql to get products available to purchase
  connection.query('SELECT * from products', function (error, results) {
	  if (error) throw error;

	  // display products on the console
	  console.log("\n------------------------------------- Amazon Store - Open For Purchase ---------------------------------\n");

		// display output using a table 
		var table = new Table({
			head: ['Product #', 'Product', 'Price'],
			colWidths: [11, 80, 10]
		});

		results.forEach(product => {

			table.push([product.item_id, product.product_name, `$${product.price}`]);
		});

		console.log(table.toString());
	 
	 // prompt the user for items to purchase
	  inquirer.prompt([
		  {
		  	type: "input",
		  	name: "itemId",
		  	message: "Please enter the Item # of the product you would like to purchase"
		  },
		  {
		  	type: "input", 
		  	name: "qty",
		  	message: "Please enter the number of units you would like to purchase"  	
		  }
	  	]).then(customerPurchase => {
	  		// validate user input
	  		if ((!customerPurchase.itemId) || (!customerPurchase.qty) || isNaN(customerPurchase.qty)) {
	  			console.log("\nPlease enter a valid Item # and Qty");
	  			openForPurchases();
	  		} else {
	  				// sql to check if store has enough units for users purchase
		  		 connection.query("SELECT product_name, stock_quantity, price, product_sales from products where item_id =?", [customerPurchase.itemId], function (error, results) {
		  		 	if (error) throw error;

		  		 	// validate sql results
		  		 	if (results.length <= 0) {
		  		 		console.log("\n No results found for the item you choose, try again\n");
		  		 		openForPurchases();
		  		 	}else {
		  		 			// tell user if store does not have enough units
			  		 	if (results[0].stock_quantity < customerPurchase.qty) {
			  		 		console.log("\n We do not have enought units to fill your order. Try back another time.");
			  		 		connection.end();
			  		 	// if store has enough units, process the users purchase
			  		 	}else {
			  		 		purchaseProducts(results[0].product_name, results[0].stock_quantity, results[0].price, results[0].product_sales, customerPurchase.itemId, customerPurchase.qty);
			  		 	}
		  		 	}
		  		 
		  		 }); // connection.query
	  		}

	  	}).catch(err => {
	  		throw err;
	  	});

	}); // connection.query
}

// function that updates the database with the stock quanity minus the purchased qty and display the total coast for purchase.
function purchaseProducts(productName, stockQuantity, price, productSales, itemId, qty) {
	 var totalCost = qty * price;

	 connection.query(
        "UPDATE products SET ? WHERE ?",
        [
          {
            stock_quantity: (stockQuantity - qty), product_sales: productSales + totalCost
          },
          {
            item_id: itemId
          }
        ],
        function(error) {
          if (error) throw err;
         
		  console.log(`\n The total cost to purchase ${qty} units of ${productName} is $${totalCost}`);
		  connection.end();

      });
}