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
    string db = "hockeytournament";
    MYSQL *conn = mysql_init(0);
    conn = mysql_real_connect(conn, "localhost", "root", "", db.c_str(), 0, NULL, 0);
    string query;
    int option;

    do {
        cout<<"Menu\n"
              "1. Show the player with most goals\n"
              "2. Make a standing of the teams\n"
              "3. Display the stats of the captains\n"
              "4. Display the player with similar goals\n"
              "5. Exit\n";
        cin>>option;
        switch(option) {
            case 1: {
                query = "SELECT player_id,no_of_goals FROM player GROUP BY player_id, no_of_goals ORDER BY no_of_goals DESC";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 2: {
                query = "SELECT no_of_wins,team_id from team GROUP BY no_of_wins,team_id ORDER BY no_of_wins DESC";
                executeQuery(conn, query, 1, 2);
                break;
            }
            case 3: {
                query = "SELECT playername,skill,team_name from player,team where captain=player_id";
                executeQuery(conn, query, 1, 3);
                break;
            }
            case 4: {
                query = "SELECT player_id, playername FROM player Group by no_of_goals";
                executeQuery(conn, query, 1, 2);
                break;
            }
        }
    }while(option != 5);
    return 0;
}

