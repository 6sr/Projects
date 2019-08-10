#include <iostream>
#include <windows.h>
#include <mysqlheaders/mysql.h>
using namespace std;

int main() {
    MYSQL* conn;
    MYSQL_ROW row;
    MYSQL_RES* res;
    conn = mysql_init(0);
    int qstate;
    if (conn)
        cout<< "Connection object OK" <<conn<< endl;
    else
        cout<< "Connection object Problem!" << mysql_error(conn) << endl;
    conn = mysql_real_connect(conn, "localhost","root","", "nsit", 0, NULL, 0);

    if (conn) {
        cout<< "Connection to Database done !!!" << conn <<endl;
        qstate = mysql_query(conn, "select * from student");
        if (!qstate) {
            res = mysql_store_result(conn);
            while (row=mysql_fetch_row(res)) {
                cout<< "Student id  :"<< row[0] << " "
                    << "Name :"<< row[1]<<" "
                    << "Roll No"<<row[2]<<endl;
            }
        }
        else {
           cout<< "Query Execution Problem!" << mysql_error(conn) << endl;
        }
    }
    else {
        cout<< "Connection object Problem!" << mysql_error(conn) << endl;
    }
    return 0;
}
