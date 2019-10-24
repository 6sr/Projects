#include<iostream>
#include<windows.h>
#include <mysqlheaders/mysql.h>
#include<string>
using namespace std;

bool executeQuery(MYSQL *conn, string query, int op, int n) {
    int qstate = mysql_query(conn, query.c_str());
    if(!qstate) {
        if(op == 0) {
            cout<<"Insertion successful\n";
            return true;
        }
        MYSQL_RES *res = mysql_store_result(conn);
        MYSQL_ROW row;
        while(row = mysql_fetch_row(res)) {
            for(int i = 0;i < n;i++) {
                if(row[i])
                    cout<<row[i]<<" ";
                else
                    cout<<"NULL ";
            }
            cout<<endl;
        }
        return true;
    }
    return false;
}

int main() {
    string db = "cust_product";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db.c_str(), 0, NULL, 0);
    string query;
    int option;

    do {
        cout<<"Menu\n"
              "1. Find the customers who have purchased more than three units of a product on a day \n"
              "2. Write a query to illustrate Left Outer, Right Outer and Full Outer Join \n"
              "3. Count number of products sold on each date \n"
              "4. Add a new attribute CUST_DOB in customer table \n"
              "5. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                query = "SELECT DISTINCT c.cust_fname, c.cust_lname FROM customer c, invoice i WHERE c.cust_num = i.cust_num AND i.unit_sold > 3";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 2: {
                query = "SELECT * FROM customer LEFT JOIN invoice ON customer.cust_num = invoice.cust_num UNION SELECT * FROM customer RIGHT JOIN invoice ON customer.cust_num = invoice.cust_num";
                executeQuery(conn, query, 1, 10);
                break;
            }
            case 3: {
                query = "SELECT inv_date, SUM(unit_sold) FROM invoice GROUP BY inv_date";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 4: {
                query = "ALTER TABLE `customer` ADD `cust_DOB` DATE NOT NULL AFTER `cust_balance`";
                executeQuery(conn, query, 1, 2);
                break;
            }
        }
    }while(option != 5);
    return 0;
}

