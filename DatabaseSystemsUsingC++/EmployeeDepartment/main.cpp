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
                cout<<row[i]<<" ";
            }
            cout<<endl;
        }
        return true;
    }
    return false;
}

int main() {
    string db = "emp_dept";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db.c_str(), 0, NULL, 0);
    string query;
    int option;

    do {
        cout<<"Menu\n"
              "1. Number of employees who joined in March 2015\n"
              "2. Second highest salary\n"
              "3. Budget of each department\n"
              "4. Maximum budget\n"
              "5. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                query = "Select COUNT(*) from employee where hiredate>='2015-03-01' and hiredate<='2015-03-31'";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 2: {
                query = "Select Max(salary) from employee where salary <> (Select MAX(salary) from employee)";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 3: {
                query = "SELECT Sum(e.salary), d.name from employee e, department d where d.deptid=e.deptid GROUP BY d.deptid";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 4: {
                query = "Select Max(budget), deptid from (SELECT Sum(e.salary) as budget, e.deptid from employee e group by e.deptid) AS foo";
                executeQuery(conn, query, 1, 2);
                break;
            }
        }
    }while(option != 5);
    return 0;
}

