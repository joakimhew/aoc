IDENTIFICATION DIVISION.
PROGRAM-ID. HELLO.

ENVIRONMENT DIVISION.
   INPUT-OUTPUT SECTION.
      FILE-CONTROL.
      SELECT MASS ASSIGN TO 'input.txt'
      ORGANIZATION IS LINE SEQUENTIAL.            

DATA DIVISION.
   FILE SECTION.
   FD MASS.
   01 MASS-FILE.
      05 MASS-NUMBER PIC 9(10).

   WORKING-STORAGE SECTION.
   01 WS-MASS.
      05 WS-MASS-NUMBER PIC 9(10).
   01 WS-EOF PIC A(1).

01 F-MASS-TOTAL PIC 9(10).

PROCEDURE DIVISION.
   OPEN INPUT MASS.
      PERFORM UNTIL WS-EOF='Y'
         READ MASS INTO WS-MASS
            AT END MOVE 'Y' TO WS-EOF
            NOT AT END 
               DIVIDE 3 INTO WS-MASS-NUMBER
               SUBTRACT 2 FROM WS-MASS-NUMBER
               ADD WS-MASS-NUMBER TO F-MASS-TOTAL
         END-READ
      END-PERFORM.
   CLOSE MASS.
   DISPLAY "THE TOTAL MASS IN PIC 9(10) IS: " F-MASS-TOTAL.
STOP RUN.