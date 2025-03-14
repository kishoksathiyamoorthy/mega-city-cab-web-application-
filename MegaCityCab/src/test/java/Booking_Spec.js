describe('MegaCityCabBookingSystem - End-to-End Tests', () => {
  
    beforeEach(() => {
      cy.visit('http://localhost:8080/MegaCityCabBookingSystem/login.jsp');
    });
  
    it('Valid User Can Login', () => {
      cy.get('input[name="username"]').type('testuser');
      cy.get('input[name="password"]').type('password123');
      cy.get('button[type="submit"]').click();
      
      cy.url().should('include', '/dashboard.jsp'); // Assert successful login
      cy.contains('Welcome, testuser').should('be.visible');
    });
  
    it('Invalid User Cannot Login', () => {
      cy.get('input[name="username"]').type('wronguser');
      cy.get('input[name="password"]').type('wrongpass');
      cy.get('button[type="submit"]').click();
      
      cy.contains('Invalid username or password').should('be.visible');
    });
  
    it('User Can Make a Booking', () => {
      cy.get('input[name="username"]').type('testuser');
      cy.get('input[name="password"]').type('password123');
      cy.get('button[type="submit"]').click();
  
      cy.url().should('include', '/dashboard.jsp');
  
      cy.visit('http://localhost:8080/MegaCityCabBookingSystem/booking.jsp');
  
      cy.get('input[name="pickupLocation"]').type('Colombo');
      cy.get('input[name="dropoffLocation"]').type('Kandy');
      cy.get('input[name="date"]').type('2025-03-12');
      cy.get('button[type="submit"]').click();
  
      cy.contains('Booking confirmed').should('be.visible');
    });
  
    it('Download Booking Report as PDF', () => {
      cy.get('input[name="username"]').type('testuser');
      cy.get('input[name="password"]').type('password123');
      cy.get('button[type="submit"]').click();
  
      cy.url().should('include', '/dashboard.jsp');
  
      cy.get('input[name="fromDate"]').type('2025-03-01');
      cy.get('input[name="toDate"]').type('2025-03-12');
      cy.get('button').contains('Download My Booking Report (PDF)').click();
  
      cy.wait(3000); // Wait for the download action
      cy.readFile('cypress/downloads/booking_report.pdf').should('exist'); // Verify file exists
    });
  
    it('Logout Functionality Works', () => {
      cy.get('input[name="username"]').type('testuser');
      cy.get('input[name="password"]').type('password123');
      cy.get('button[type="submit"]').click();
  
      cy.url().should('include', '/dashboard.jsp');
  
      cy.get('a').contains('Logout').click();
      cy.url().should('include', '/login.jsp');
    });
  
  });
  
