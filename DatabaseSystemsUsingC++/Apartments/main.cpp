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
    string db = "apartment";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db.c_str(), 0, NULL, 0);
    string query, buildno;
    int option;

    do {
        cout<<"Menu\n"
              "1. Appartment number with maximum rent\n"
              "2. Total number of apartments\n"
              "3. Name of buildings with floor greater than 3\n"
              "4. Building name (sort) according to the number of floors\n"
              "5. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                cout<<"Enter the building number ";
                cin>>buildno;
                query = "select Ano, MAX(rent) FROM apartment GROUP BY Bno having Bno=" + buildno;
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 2: {
                cout<<"Enter the building number ";
                cin>>buildno;
                query = "SELECT COUNT(Ano) from apartment where floor=3 and Bno=" + buildno;
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 3: {
                query = "select building.Bname from building, apartment where building.Bno=apartment.Bno and  apartment.floor>=3 GROUP BY apartment.Bno";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 4: {
                query = "select building.Bname, COUNT(*) from building, apartment where building.Bno=apartment.Bno GROUP BY apartment.Bno order by COUNT(*)";
                executeQuery(conn, query, 1, 2);
                break;
            }
        }
    }while(option != 5);
    return 0;
}

