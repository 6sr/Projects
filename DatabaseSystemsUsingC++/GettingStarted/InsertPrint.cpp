#include <iostream>
#include <windows.h>
#include <mysqlheaders/mysql.h>
#include<string>
#include<stdio.h>
using namespace std;
void Insert(){
    MYSQL* conn;
    conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost","root","", "nsit", 0, NULL, 0);
    int qstate;
    string name,id, rollno,query;
    cout<<"\tStudent id: ";
    cin>>id;
    cout<<"\tName: ";
    cin>>name;
    cout<<"\tRoll no: ";
    cin>>rollno;
    query = "insert into student(studentid, name, rollno) values('" + id + " ',' " + name + " ',' " + rollno + " ' ) ";
    qstate = mysql_query(conn, query.c_str());
    if (!qstate) {
        cout<<"\tInsertion Successful";
    }
    else {
        cout<<"\tInsertion failed";
    }
}
void Display(){
    MYSQL* conn;
    MYSQL_ROW row;
    MYSQL_RES* res;
    conn = mysql_init(0);
    int qstate;

    conn = mysql_real_connect(conn, "localhost","root","", "nsit", 0, NULL, 0);

    qstate = mysql_query(conn, "select * from student");
    cout<<"\tStudent id | Name | Roll No\n";
    if (!qstate) {
        res = mysql_store_result(conn);
        while (row=mysql_fetch_row(res)) {
            cout<<"\t"<< row[0] << " " << row[1]<<" " <<row[2]<<endl;
        }
    }
}

int main() {
    int choice;
    do {
        cout<<"\n\tMenu\n";
        cout<<"\t1. Insert\n";
        cout<<"\t2. Display\n";
        cout<<"\t3. Exit\n\t";
        cin>>choice;
        switch(choice){
            case 1: Insert();
                    break;
            case 2: Display();
                    break;
        }
    }while(choice!=3);
    return 0;
}

