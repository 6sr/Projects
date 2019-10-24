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
    string db = "library";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db.c_str(), 0, NULL, 0);
    string query;
    int option;

    do {
        cout<<"Menu\n"
              "1. Show the books available for course CEC06\n"
              "2. Students who have not issued a book\n"
              "3. Books which have 0 copies left\n"
              "4. Student which borrowed most books\n"
              "5. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                query = "SELECT BookID, Title from books where Coursename = 'CEC06'";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 2: {
                query = "Select Sid, Sname from student where Sid NOT IN (SELECT Sid FROM borrow)";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 3: {
                query = "select BookID, Title from books where noofcopies=0";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 4: {
            query = "select A.Sid, A.Sname, count(B.BookID) as Booksborrowed from student as A, borrow as B where A.Sid=B.Sid group by B.Sid order by count(B.BookID) desc";
                executeQuery(conn, query, 1, 3);
                break;
            }
        }
    }while(option != 5);
    return 0;
}

