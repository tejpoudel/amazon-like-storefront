
# Amazon-like-storefront

## Customer View
1.The app should then prompt users with two messages.
  --The first should ask them the ID of the product they would like to buy.
  --The second message should ask how many units of the product they would like to buy.
  
2.Once the customer has placed the order, your application should check if your store has enough of the product to meet the customer's request.
  --If not, the app should log a phrase like Insufficient quantity!, and then prevent the order from going through.
  
3.However, if your store does have enough of the product, you should fulfill the customer's order.

4.This means updating the SQL database to reflect the remaining quantity.

5.Once the update goes through, show the customer the total cost of their purchase.

## Heres a Snapshot of Storefront App

!(https://github.com/tejpoudel/amazon-like-storefront/blob/master/result.png)

## The result of database

!(https://github.com/tejpoudel/amazon-like-storefront/blob/master/database.png)

<br>

## Here are the packages I used: 
     var Table = require('cli-table');
     var inquirer = require('inquirer');
     var mysql      = require('mysql');
