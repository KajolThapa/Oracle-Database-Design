        CREATE TABLE PASSENGER( 
        PassengerID	         NUMBER(10) PRIMARY KEY,
        First                   VARCHAR(20) NOT NULL,
        Middle		           VARCHAR(20) NOT NULL,
        Last	               VARCHAR(20) NOT NULL,
        Gender                     CHAR(1) NOT NULL,
        Phone                    NUMBER(10) NOT NULL,
        Email                   VARCHAR(50) NOT NULL,
        PassengerType    VARCHAR(20) NULL);
        
        CREATE TABLE PASSENGER_CREDITCARD(
        CreditCardNum NUMBER(16) PRIMARY KEY,
        MerchanetName VARCHAR(30) NOT NULL,
        ExpDate DATE NOT NULL);
           
        CREATE TABLE CREDITCARD(
        CreditCardNum			NUMBER(16) NOT NULL,
        PassengerID	          	NUMBER(10) NOT NULL,
        CONSTRAINT  CreditCardNum_PassengerID_PK PRIMARY KEY(CreditCardNum,PassengerID),
        CONSTRAINT  PassengerID_FK FOREIGN KEY(PassengerID) REFERENCES PASSENGER(PassengerID),
        CONSTRAINT  CreditCardNum_FK FOREIGN KEY(CreditCardNum) REFERENCES PASSENGER_CREDITCARD(CreditCardNum));
             
         CREATE TABLE AGENCY_DISCOUNT(
         AgencyDiscountCode	         NUMBER(10)PRIMARY KEY,
         AgencyDiscountAmount           	DEC(8,2)NOT NULL);
           
        CREATE TABLE STANDARD(
        SPassengerID			NUMBER(10)PRIMARY KEY,
        PromoDiscountCode		CHAR(10)NOT NULL,
        CONSTRAINT  SPassengerID_FK FOREIGN KEY(SPassengerID) REFERENCES PASSENGER(PassengerID));
     
        CREATE TABLE TRAVEL_AGENCY(
        TPassengerID            	NUMBER(10) PRIMARY KEY,
        TravelAgencyID               NUMBER(10) NOT NULL,
        TravelAgencyName        VARCHAR(50)NOT NULL,
        AgencyAddress           VARCHAR(50)NOT NULL,
        AgencyPhone               NUMBER(10)NOT NULL,
        BookingAgentName  	VARCHAR(50)NOT NULL,
        AgencyDiscountCode	  Number(10) NOT NULL,
        CONSTRAINT AgencyDiscountCode_FK FOREIGN KEY(AgencyDiscountCode) REFERENCES AGENCY_DISCOUNT(AgencyDiscountCode),
        CONSTRAINT  TPassengerID_FK FOREIGN KEY(TPassengerID) REFERENCES PASSENGER(PassengerID));
        
        
        CREATE TABLE FREQUENT_FLYER(
        FPassengerID             	NUMBER(10) PRIMARY KEY,
        FreqFlyerNum                NUMBER(10) NOT NULL,
        FreqFlyerMileage                      FLOAT NOT NULL,
        MileageBalance	                 	FLOAT NOT NULL,
        MileageExpDate                     	DATE NOT NULL,
        CONSTRAINT  FPassengerID_FK FOREIGN KEY(FPassengerID) REFERENCES PASSENGER(PassengerID));
        
        CREATE TABLE US_MILITARY(
        UPassengerID                      NUMBER(10)PRIMARY KEY,
        USMilitaryID                    NUMBER(10)NOT NULL,
        MilitaryBranch               VARCHAR(20)NOT NULL,
        MilitaryDiscountCode          CHAR(10)NOT NULL,
        CONSTRAINT  UPassengerID_FK FOREIGN KEY(UPassengerID) REFERENCES PASSENGER(PassengerID));
        
        CREATE TABLE TRAVEL_CLASS(
        TravelClassID			NUMBER(10) PRIMARY KEY,
        TravelClass         	CHAR(20)NOT NULL);
        
        CREATE TABLE RESERVATION_STATUS(
        ReservationStatusID NUMBER(10) PRIMARY KEY,
        ReservationStatus VARCHAR(20)NOT NULL);
        
       CREATE TABLE AIRLINE(
       AirlineCode CHAR(10) PRIMARY KEY,
       AirlineName VARCHAR(50) NOT NULL,
       HeadquartersAddress VARCHAR(50) NOT NULL );
        
        CREATE TABLE FLIGHT(
        FlightNumber CHAR(10) PRIMARY KEY,
        Destination VARCHAR(50) NOT NULL,
        FlightDate DATE NOT NULL,
        DepartureTime Timestamp(0) NOT NULL,
        ArrivalTime   Timestamp(0)NOT NULL,
        FlightTime    Timestamp(0) NOT NULL,
        AirlineCode CHAR(10),
        CONSTRAINT  AirlineCode_FK FOREIGN KEY( AirlineCode) REFERENCES  Airline( AirlineCode) );
      
        CREATE TABLE AIRPLANE(
        AirplaneID			NUMBER(10)PRIMARY KEY,
        AircraftType	           	CHAR(10)NOT NULL,
        SeatCapacity            NUMBER (38)NOT NULL,
        AirlineCode		            CHAR(10) NOT NULL,
        CONSTRAINT  AirlineCodeAirplane_FK FOREIGN KEY( AirlineCode) REFERENCES  Airline( AirlineCode)) ;
             
             
       CREATE TABLE RESERVATION(
       ReservationID NUMBER(10)PRIMARY KEY,
       PassengerID NUMBER(10) NOT NULL,
       FlightNumber CHAR(10) NOT NULL,
       ReservationDate DATE NOT NULL,
       SeatNumber CHAR(4) NOT NULL,
       Cost DEC(8,2) NOT NULL,
       TravelClassID NUMBER(10) NOT NULL,
       ReservationStatusID NUMBER(10) NOT NULL,
       CONSTRAINT PassengerIDD_FK FOREIGN KEY(PassengerID) REFERENCES Passenger(PassengerID),
       CONSTRAINT FlightNumber_FK FOREIGN KEY(FlightNumber) REFERENCES Flight(FlightNumber),
       CONSTRAINT TravelClassID_FK FOREIGN KEY(TravelClassID) REFERENCES Travel_Class(TravelClassID),
       CONSTRAINT ReservationStatusID_FK FOREIGN KEY(ReservationStatusID) REFERENCES Reservation_Status(ReservationStatusID)
       );
       
       CREATE TABLE AIRPORT(
       AirportCode CHAR(10) PRIMARY KEY,
       AirportName VARCHAR(20) NOT NULL,
       City VARCHAR(30) NOT NULL,
       State VARCHAR(35) NOT NULL)
      
      
       CREATE TABLE FLIGHT_DESTINATION_AIRPORT(
       FlightNumber CHAR(10) NOT NULL,
       AirportCode CHAR(10)NOT NULL,
       CONSTRAINT  FlightNumberF_AirportCode_PK PRIMARY KEY(FlightNumber, AirportCode),
       CONSTRAINT  FlightNumberFlightF_FK FOREIGN KEY(FlightNumber) REFERENCES FLIGHT (FlightNumber),
       CONSTRAINT  AirportCodeCode_FK FOREIGN KEY(AirportCode) REFERENCES Airport (AirportCode));
       
       CREATE TABLE FLIGHT_ARRIVAL_AIRPORT(
       FlightNumber CHAR(10) NOT NULL,
       AirportCode CHAR(10) NOT NULL,
       CONSTRAINT  FlightNumberAirportCode_PK PRIMARY KEY(FlightNumber, AirportCode),
       CONSTRAINT  FlightNumberFlight_FK FOREIGN KEY (FlightNumber) REFERENCES FLIGHT(FlightNumber),
       CONSTRAINT  AirportCodeC_FK FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode));
       
       CREATE TABLE LANDING_AIRPORT(
       AirportCode CHAR(10) NOT NULL,
       AirplaneID NUMBER(10) NOT NULL,
       CONSTRAINT  AirportCode_AirplaneID_PK PRIMARY KEY(AirportCode,AirplaneID),
       CONSTRAINT  AirportCode_FK FOREIGN KEY (AirportCode) REFERENCES Airport(AirportCode),
       CONSTRAINT  AirplaneIDD_FK FOREIGN KEY (AirplaneID) REFERENCES Airplane(AirplaneID));
    
       
             
             
             
             