#include <iostream>
#include <windows.h>
#include<string>
#include <mysqlheaders/mysql.h>
using namespace std;

class mysqlClass {
    public:
    MYSQL* conn;
    mysqlClass(string db) {
        conn = mysql_init(0);

        if (conn) {
            cout<< "Connection object OK" <<conn<< endl;
        }
        else {
            cout<< "Connection object Problem!" << mysql_error(conn) << endl;
        }

        conn = mysql_real_connect(conn, "localhost","root","", db.c_str(), 0, NULL, 0);
    }
    bool runQuery(string query, string tableColumns[], int n, int operation) {
        MYSQL_ROW row;
        MYSQL_RES* res;
        cout<<"About to execute query from runQuery function"<<endl;
        int qstate = mysql_query(conn, query.c_str());
        if (!qstate) {
            if(operation == 0) {    // Insertion done
                return true;
            }
            res = mysql_store_result(conn);
            row = mysql_fetch_row(res);
            for(int i = 0;i < n;i++) {
                cout<<tableColumns[i]<<"     ";
            }
            cout<<endl;
            while (row) {
                for(int i = 0;i < n;i++) {
                    cout<<row[i]<<"     ";
                }
                row = mysql_fetch_row(res);
                cout<<endl;
            }
            cout<<endl;
            return true;
        }
        else {
            cout<< "Query Execution Problem!" << mysql_error(conn) << endl;
        }
        return false;
    }
};

void branch(mysqlClass obj);
void employee(mysqlClass obj);
void customer(mysqlClass obj);
void account(mysqlClass obj);

int main() {
    string db = "banknsit";
    mysqlClass obj(db);

    if (obj.conn) {
        int choice;
        do {
            cout<<"Menu \n"
                  "1. Branch\n"
                  "2. Employee\n"
                  "3. Customer\n"
                  "4. Account\n"
                  "5. Exit\n";
            cin>>choice;
            switch(choice) {
                case 1: branch(obj); break;
                case 2: employee(obj); break;
                case 3: customer(obj); break;
                case 4: account(obj); break;
                case 5 : break;
                default: cout<<"Enter a valid choice\n"; break;
            }
        } while(choice != 5);
    }
    else {
        cout<< "Connection object Problem!" << mysql_error(obj.conn) << endl;
    }
    return 0;
}

void branch(mysqlClass obj) {
    int choice;
    string tableColumns[] = {"IFSC", "Address"};
    int n = 2;
    do {
        cout<<"Branch Menu\n"
              "1. Add new branch\n"
              "2. Display branches\n"
              //"2. Remove old branch\n"
              "3. Exit\n";
        cin>>choice;
        switch(choice) {
            case 1: {
                cin.ignore();
                string ifsc, address;
                cout<<"Enter ifsc code : ";
                getline(cin, ifsc);
                cout<<"Enter address : ";
                getline(cin, address);

                string query = "insert into branch(ifsc, address) values('" + ifsc + "','" + address + "')";
                if(obj.runQuery(query, tableColumns, n, 0)) {
                    cout<<"Branch Created"<<endl;
                }
                else {
                    cout<<"Branch Creation Failed"<<endl;
                }
            }
            break;
            case 2: {
                string query = "select * from branch";
                if(!obj.runQuery(query, tableColumns, n, 1)) {
                    cout<<"Could not display branch details"<<endl;
                }
            }
            break;
        }
    }while(choice != 3);
}

void employee(mysqlClass obj) {
    int choice;
    string tableColumns[] = {"ID", "NAME", "IFSC", "DESIGNATION"};
    int n = 4;
    do {
        cout<<"Employee Menu\n"
              "1. Add new employee\n"
              "2. Display employee\n"
              //"2. Remove old employee\n"
              "3. Exit\n";
        cin>>choice;
        switch(choice) {
            case 1: {
                cin.ignore();
                string name, ifsc, designation;
                cout<<"Enter employee name : ";
                getline(cin, name);
                cout<<"Enter employee ifsc code : ";
                getline(cin, ifsc);
                cout<<"Enter employee designation : ";
                getline(cin, designation);

                string query = "insert into employee(name, ifsc, designation) values('" + name + "','" + ifsc + "','" + designation + "')";
                if(obj.runQuery(query, tableColumns, n, 0)) {
                    cout<<"Employee Created"<<endl;
                }
                else {
                    cout<<"Employee Creation Failed"<<endl;
                }
            }
            break;
            case 2: {
                string query = "select * from employee";
                if(!obj.runQuery(query, tableColumns, n, 1)) {
                    cout<<"Could not display employee details"<<endl;
                }
            }
            break;
        }
    }while(choice != 3);
}

void customer(mysqlClass obj) {
    int choice;
    string tableColumns[] = {"ID", "NAME", "IFSC"};
    int n = 3;
    do {
        cout<<"Employee Menu\n"
              "1. Add new customer\n"
              "2. Display customer\n"
              //"2. Remove old customer\n"
              "3. Exit\n";
        cin>>choice;
        switch(choice) {
            case 1: {
                cin.ignore();
                string name, ifsc;
                cout<<"Enter customer name : ";
                getline(cin, name);
                cout<<"Enter customer ifsc code : ";
                getline(cin, ifsc);

                string query = "insert into customers(name, ifsc) values('" + name + "','" + ifsc + "')";
                if(obj.runQuery(query, tableColumns, n, 0)) {
                    cout<<"Customer Created"<<endl;
                }
                else {
                    cout<<"Customer Creation Failed"<<endl;
                }
            }
            break;
            case 2: {
                string query = "select * from customers";
                if(!obj.runQuery(query, tableColumns, n, 1)) {
                    cout<<"Could not display customer details"<<endl;
                }
            }
            break;
        }
    }while(choice != 3);
}

void account(mysqlClass obj) {
    int choice;
    string tableColumns[] = {"ACCOUNT_NO", "ACCOUNT_HOLDER_TYPE", "ID", "ACCOUNT_TYPE", "BALANCE"};
    int n = 5;
    do {
        cout<<"Account Menu\n"
              "1. Add new account\n"
              "2. Display account\n"
              //"2. Remove old account\n"
              "3. Exit\n";
        cin>>choice;
        switch(choice) {
            case 1: {
                cin.ignore();
                string id, account_type, balance, account_holder_type;
                cout<<"Enter account holder type (Employee/Customer) : ";
                getline(cin, account_holder_type);
                cout<<"Enter customer/employee id : ";
                getline(cin, id);
                cout<<"Enter account type : ";
                getline(cin, account_type);
                cout<<"Enter account balance : ";
                getline(cin, balance);

                string query = "insert into account(account_holder_type, id, account_type, balance) values('" + account_holder_type + "','" + id + "','" + account_type + "','" + balance + "')";
                if(obj.runQuery(query, tableColumns, n, 0)) {
                    cout<<"account Created"<<endl;
                }
                else {
                    cout<<"account Creation Failed"<<endl;
                }
            }
            break;
            case 2: {
                string query = "select * from account";
                if(!obj.runQuery(query, tableColumns, n, 1)) {
                    cout<<"Could not display account details"<<endl;
                }
            }
            break;
        }
    }while(choice != 3);
}

