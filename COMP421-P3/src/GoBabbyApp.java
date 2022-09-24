
import java.sql.* ;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;  // Import the Scanner class

public class GoBabbyApp {
    public static void main(String[] args) throws SQLException {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode = 0;      // Variable to hold SQLCODE
        String sqlState = "00000";  // Variable to hold SQLSTATE

        if (args.length > 0)
            tableName += args[0];
        else
            tableName += "exampletbl";

        // Register the driver.  You must register the driver before you can use it.
        try {
            DriverManager.registerDriver(new com.ibm.db2.jcc.DB2Driver());
        } catch (Exception cnfe) {
            System.out.println("Class not found");
        }

        // This is the url you must use for DB2.
        //Note: This url may not valid now ! Check for the correct year and semester and server name.
        String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

        //REMEMBER to remove your user id and password before submitting your code!!
        String your_userid = "fwei2";
        String your_password = ""; // ******REMOVE BEFORE SUBMIT
        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if (your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if (your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null) {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        Connection con = DriverManager.getConnection(url, your_userid, your_password);
        Statement statement = con.createStatement();

        //START OF USER INPUT SET UP
        Scanner sc = new Scanner(System.in);  // Create a Scanner object


        System.out.println("Please enter your practitioner ID. [E] to exit:");

        //VARIABLES OF FIRST PROMPT
        String PID;
        String DATE;

        //FIRST PROMPT
        //asking practitioner id + appointment
        while (true) {

            String pid = sc.nextLine(); //pract id, string as it could be "e" for exit
            PID = pid; // declare for next loop/instruction

            //exit case
            if (pid.equalsIgnoreCase("E")) {
                statement.close();
                con.close();
                System.out.println("Exiting... Goodbye!");
                System.exit(0);
            }

            //QUERYING EXISTENCE OF PRACT ID:
            try {
                String querySQL0 = "SELECT PRACTID FROM MIDWIFE WHERE PRACTID = " + pid;
                java.sql.ResultSet rs0 = statement.executeQuery(querySQL0);
                if (!rs0.next()) {
                    System.out.println("Invalid practitioner ID, please enter a valid ID, or [E] to exit:");
                    continue;
                } else {
                    break; //go to next instruction prompt
                }

            } catch (SQLException e) {
                sqlCode = e.getErrorCode(); // Get SQLCODE
                sqlState = e.getSQLState(); // Get SQLSTATE

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }

        //SECOND PROMPT: ASK FOR DATE
        //PRACTID IS VALID, NOW INQUIRE ABOUT DATE.
        String chosenName = null;
        int chosenRAMQ = 0;
        int noteID = 8100; //tracker of noteID, ensures that we have a unique NoteID everytime
        date:
        while (true) {
            //list for the appointment number choice.
            List<Integer> counterList = new ArrayList<Integer>();

            //lists of all chose appointment, ordered
            List<String> nameList = new ArrayList<String>();
            List<Integer> ramqList = new ArrayList<Integer>();

            System.out.println("Please enter the date for appointment list. [E] to exit:");
            String date = sc.nextLine();

            //exit case
            if (date.equalsIgnoreCase("e")) {
                statement.close();
                con.close();
                System.out.println("Exiting... Goodbye!");
                System.exit(0);
            }

            DATE = date;


            //NESTED LOOP FOR NEXT MENU: LIST ALL APPOINTMENTS FOR THAT DATE
            int apptID = 0;
            appointment:
            while (true) {

                //QUERYING APPOINTMENTS FOR THIS PRACTITIONER, PRACTID WILL BE VALID, ALSO ASSUME USER ENTER VALID DATE.
                try {
                    String querySQL =
                            "SELECT ATIME, NAME, M.MOMRAMQ, APPTID, BACKUP FROM APPOINTMENTS JOIN MOTHER M ON APPOINTMENTS.MOMRAMQ = M.MOMRAMQ WHERE PRACTID = " +
                                    PID + " AND ADATE = '" + DATE + "' ORDER BY ATIME";

                    java.sql.ResultSet rs = statement.executeQuery(querySQL);


                    int counter = 1;
                    while (rs.next()) {
                        String time = rs.getTime(1).toString(); //format as String for println
                        String name = rs.getString(2);
                        int ramq = rs.getInt(3);
                        apptID = Integer.parseInt(rs.getString(4)); //store apptID for later user
                        String backup = rs.getString(5); //tells us if midwife is backup or not
                        System.out.println(counter + ": " + time + " " + backup + " " + name + " " + ramq); //PRINTOUT TO SYSTEM
                        //adding them to list for retrieval later.
                        counterList.add(counter);
                        nameList.add(name);
                        ramqList.add(ramq);

                        counter++;
                    }
                    //nothing in namelist, i.e. no appointment.
                    if (nameList.isEmpty()) {
                        System.err.println("There is no appointment for this midwife on this date. Please try again.");
                        continue date;
                    }
//                }
                } catch (SQLException e) {
                    sqlCode = e.getErrorCode(); // Get SQLCODE
                    sqlState = e.getSQLState(); // Get SQLSTATE

                    // Your code to handle errors comes here;
                    // something more meaningful than a print would be good
                    System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                    System.out.println(e);
                }

                System.out.println("Enter the appointment number that you would like to work on."
                        + "\n" + "[E] to exit [D] to go back to another date :");

                String num = sc.nextLine();

                //exit case
                if (num.equalsIgnoreCase("e")) {
                    statement.close();
                    con.close();
                    System.out.println("Exiting... Goodbye!");
                    System.exit(0);
                }
                //GO BACK AND ASK FOR DATE
                else if (num.equalsIgnoreCase("d")) {
                    continue date;
                }
                //else a correct number was chosen
                else if (counterList.contains(Integer.parseInt(num))) {
                    int index = Integer.parseInt(num) - 1;
                    chosenName = nameList.get(index); //assign chosenName to correct name
                    chosenRAMQ = ramqList.get(index);
                     // proceed to next menu
                } else {
                    System.out.println("Invalid input, please try again.");
                    continue appointment;
                }

                //THIRD PROMPT. OPTION MENU
                user:
                while (true) {

                    System.out.println("For " + chosenName + " " + chosenRAMQ);
                    System.out.println("\n");
                    System.out.println("1. Review notes\n"
                            + "2. Review tests\n"
                            + "3. Add a note\n"
                            + "4. Prescribe a test\n"
                            + "5. Go back to the appointments\n"
                            + "\n Enter your choice:");

                    int choice = Integer.parseInt(sc.nextLine()); //ASSUME FROM THIS POINT, USER WILL NOT BE ABLE TO EXIT.

                    //go back choosing an appointment, last menu
                    if (choice == 5) {
                        continue appointment;}
                    //Review notes
                    else if(choice == 1){
                        //QUERYING NOTE CONTENT + TIMESTAMPS
                        try {
                            String querySQL =
                                    "SELECT ADATE, ATIME, CONTENT FROM APPOINTMENTS A FULL JOIN NOTES  N ON A.APPTID = N.APPTID WHERE MOMRAMQ = "
                                    + chosenRAMQ;

                            java.sql.ResultSet rs = statement.executeQuery(querySQL);

                            while (rs.next()) {
                                String aDate = rs.getDate(1).toString(); //format as String for println
                                String time = rs.getTime(2).toString();
                                String content = rs.getString(3);

                                System.out.println(aDate + " " + time + " " + content); //PRINTOUT TO SYSTEM
                            }

                        } catch (SQLException e) {
                            sqlCode = e.getErrorCode(); // Get SQLCODE
                            sqlState = e.getSQLState(); // Get SQLSTATE

                            // Your code to handle errors comes here;
                            // something more meaningful than a print would be good
                            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                            System.out.println(e);
                        }
                        continue user; //then displays user menu with the 5 options
                    }
                    //Review tests
                    else if(choice == 2){
                        try {
                            String querySQL =
                                    "SELECT DATEPRESC, TYPE, CONTENT FROM TESTS T FULL JOIN PREGNANCY_RESULT P ON T.RESULTID = P.RESULTID " +
                                            "WHERE LOGINID = (SELECT LOGINID FROM COUPLE WHERE MOMRAMQ = " + chosenRAMQ + ")";

                            java.sql.ResultSet rs = statement.executeQuery(querySQL);

                            while (rs.next()) {
                                String aDate = rs.getDate(1).toString(); //format as String for println
                                String type = rs.getString(2);
                                String content = rs.getString(3);

                                System.out.println(aDate + " [" + type + "] " + content); //PRINTOUT TO SYSTEM
                            }

                        } catch (SQLException e) {
                            sqlCode = e.getErrorCode(); // Get SQLCODE
                            sqlState = e.getSQLState(); // Get SQLSTATE

                            // Your code to handle errors comes here;
                            // something more meaningful than a print would be good
                            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                            System.out.println(e);
                        }
                        continue user; //then displays user menu with the 5 options
                    }
                    //Add a note
                    else if (choice == 3){
                        System.out.println("Please type your observation:");
                        String note = sc.nextLine();
                        List<Integer> noteIDlist = new ArrayList<Integer>(); //we must first get all noteIDs

                        try {
                            String querySQL =
                                    "SELECT NOTEID FROM NOTES";

                            java.sql.ResultSet rs = statement.executeQuery(querySQL);

                            while (rs.next()) {
                                String noteId = rs.getString(1);
                                noteIDlist.add(Integer.parseInt(noteId));
                            }

                        } catch (SQLException e) {
                            sqlCode = e.getErrorCode(); // Get SQLCODE
                            sqlState = e.getSQLState(); // Get SQLSTATE

                            // Your code to handle errors comes here;
                            // something more meaningful than a print would be good
                            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                            System.out.println(e);
                        } //QUERYING ALL NOTEID AND ADDING THEM TO IDLIST
                        int uniqueID = 8001;
                        while(noteIDlist.contains(uniqueID)) { uniqueID ++;} //getting a uniqueID

                        try {
                            String querySQL =
                                    "INSERT INTO NOTES (NOTEID, DATECREATED, TIMECREATED, CONTENT, APPTID) VALUES ( " +
                                            uniqueID + ", '" + DATE + "', '9.00.00', '" + note + "', "+ apptID + ")";

                            statement.executeUpdate(querySQL);
                            System.out.println("Note created successfully");
                        } catch (SQLException e) {
                            sqlCode = e.getErrorCode(); // Get SQLCODE
                            sqlState = e.getSQLState(); // Get SQLSTATE

                            // Your code to handle errors comes here;
                            // something more meaningful than a print would be good
                            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                            System.out.println(e);
                        } //THEN, INSERT note INTO NOTES
                        continue user; //then displays user menu with the 5 options



                    }
                    //Prescribe a test
                    else if (choice == 4){
                        System.out.println("Please enter the type of test:");

                        String testType = sc.nextLine(); //assume client will enter correct type
                        int uniqueSampleID = 5001;
                        List<Integer> sampleIDList = new ArrayList<Integer>();
                        try {
                            String querySQL =
                                    "SELECT SAMPLEID FROM TESTS";

                            java.sql.ResultSet rs = statement.executeQuery(querySQL);

                            while (rs.next()) {
                                String noteId = rs.getString(1);
                                sampleIDList.add(Integer.parseInt(noteId));
                            }

                        } catch (SQLException e) {
                            sqlCode = e.getErrorCode(); // Get SQLCODE
                            sqlState = e.getSQLState(); // Get SQLSTATE

                            // Your code to handle errors comes here;
                            // something more meaningful than a print would be good
                            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                            System.out.println(e);
                        } //QUERYING ALL sampleID AND ADDING THEM TO sampleIDLIST
                        while(sampleIDList.contains(uniqueSampleID)){ uniqueSampleID++;} //creating unique sample ID
                        try {
                            String querySQL =
                                    "INSERT INTO TESTS (SAMPLEID, TYPE, DATEPRESC, CONTENT, PRACTID, RESULTID, TECHID) VALUES (" +
                                            uniqueSampleID + ", '"+ testType + "', '" + DATE + "', 'null content', " + PID +
                                            ", (SELECT RESULTID FROM PREGNANCY_RESULT WHERE LOGINID = (SELECT LOGINID FROM COUPLE WHERE MOMRAMQ = " + chosenRAMQ + ")FETCH FIRST 1 ROWS ONLY)"+ ", 3001)";



                            statement.executeUpdate(querySQL);
                            System.out.println("Test created successfully");
                        } catch (SQLException e) {
                            sqlCode = e.getErrorCode(); // Get SQLCODE
                            sqlState = e.getSQLState(); // Get SQLSTATE

                            // Your code to handle errors comes here;
                            // something more meaningful than a print would be good
                            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                            System.out.println(e);
                        } //THEN, INSERT note INTO NOTES



                    }


                }
            }



        }
    }
}
