# Bank System
  
In a country, bank has many branches.  
Each branch is identified with help of IFSC code.  
Each branch has mutiple customers.  
Customer also include employee of that particular branch.  
Employee can be a manager or staff of that branch.  
Branch gives each customer a cust_id in order to identify them.  
Customer can open two types of account - Savings and Fixed Deposit  

Database Schema -  
- branch - ifsc, branch address  
- employee - id, name, ifsc, designation  
- customer - id, name, ifsc  
- account - account_no, account_holder_type, id, account_type, balance  

