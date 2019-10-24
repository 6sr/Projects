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
    string db = "boatreservation";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db, 0, NULL, 0);
    string query;
    int option;
    
    do {
        cout<<"Menu\n"
              "1. Name of sailors who reserved boats\n"
              "2. Name of sailors who reserved red or green boat in March\n"
              "3. Name of sailors who reserved red and green boat\n"
              "4. Sid of sailor who not reserved after January 2018\n"
              "5. Sailors whose rating is greater than that of all sailors named 'John'\n"
              "6. Sailor who reserved all boats\n"
              "7. Name and age of all sailors\n"
              "8. Age of youngest sailor for each rating with atleast 2 such sailors\n"
              "9. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                query = "select distinct Sname from sailors, reserve where sailors.Sid=reserve.Sid";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 2: {
                query = "select Sname from sailors, reserve, boats where sailors.Sid=reserve.Sid and boats.Bid=reserve.Bid and (boats.color='red' or boats.color='green') and reserve.day like '1998-03%'";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 3: {
                query = "(Select s.sname from sailors s, reserve r, boats b where s.sid=r.sid and r.bid=b.bid and b.color='red') INTERSECT (Select s2.sname from sailors s2, reserve r2, boats b2 Where s2.sid=r2.sid and r2.bid=b2.bid and b2.color='green')";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 4: {
                query = "select sailors.Sid from sailors, reserve where sailors.Sid=reserve.Sid and reserve.day<'2019-01-01'";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 5: {
                query = "select s.Sid from sailors s where s.Rating > (SELECT s2.Rating from sailors s2 where s2.Sname='John')";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 6: {
                query = "SELECT s.Sname FROM sailors s WHERE NOT EXISTS ((SELECT b.Bid FROM boats b) EXCEPT (SELECT r.Bid FROM reserve r WHERE  r.Sid=s.Sid))";
                executeQuery(conn, query, 1, 1);
                break;
            }
            case 7: {
                query = "select Sname, Age from sailors where Age=(select MAX(Age) from sailors)";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 8: {
                query = "select MIN(Age), Rating from sailors group by Rating having COUNT(Rating)>=2";
                executeQuery(conn, query, 1, 1);
                break;
            }
        }
    }while(option != 9);
    return 0;
}

