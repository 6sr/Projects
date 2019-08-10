# Getting Started  
1. Downlaod [Code Blocks](http://www.codeblocks.org/downloads/26)  
2. Downlaod [XAMPP Server](https://www.apachefriends.org/index.html) for mysql  
Before installing XAMPP make sure port `3306` is free and you don't have mysql already installed
3. Start Apache and MySQL Server through xampp control panel  
4. Start new project with new console application in Code Blocks  
5. Choose language as `C++`  
6. Give project title and select default compiler  
7. Right click on project name and select `Build Options`  
8. In Linker settings, add path of `libmysql.a` file
9. In Search Directories, add path of directory where Code Blocks is installed  
10. Add all the header files to the include path of compiler  
11. Write your own code and build it  
12. copy `libmysql.dll` file to `\bin\debug` directory  

