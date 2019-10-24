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
    string db = "student_attendance";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db.c_str(), 0, NULL, 0);
    string query, rollno, subject;
    int option;

    do {
        cout<<"Menu\n"
              "1. Display the attendance of a particular student in a semester\n"
              "2. Attendance of a student in a particular subject\n"
              "3. Attendance of a student on the date of medical\n"
              "4. Total attendance in a semester\n"
              "5. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                cout<<"Add a roll no ";
                cin>>rollno;
                query = "SELECT * FROM dailyattendance d WHERE d.roll_no = "+rollno+" AND d.sem = 3";
                executeQuery(conn, query, 1, 7);
                break;
            }
            case 2: {
                cout<<"Add a roll no ";
                cin>>rollno;
                cout<<"Add a course code ";
                cin>>subject;
                query = "SELECT roll_no, date, "+subject+" FROM dailyattendance WHERE roll_no = "+rollno+" AND sem = 3";
                executeQuery(conn, query, 1, 3);
                break;
            }
            case 3: {
                query = "SELECT d.* from dailyattendance d,medicalrecord m where d.roll_no = m.roll_no AND d.date = m.date";
                executeQuery(conn, query, 1, 7);
                break;
            }
            case 4: {
                query = "SELECT d.roll_no, d.sem ,COUNT(*) as Total_Classes, SUM(d.CEC01)AS CEC01,SUM(d.CEC02)AS CEC02,SUM(d.CEC03)AS CEC03,SUM(d.CEC04)AS CEC04 from dailyattendance d where d.sem =3 group by d.roll_no";
                executeQuery(conn, query, 1, 7);
                break;
            }
        }
    }while(option != 5);
    return 0;
}

