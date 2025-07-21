# SET Pizza Shop - Multi-Page Web Application

> **Full-Stack Web Developer | Individual Project**  
> **Duration**: Academic Project  
> **Institution**: Independent Development

A complete e-commerce web application for online pizza ordering featuring dynamic pricing, state management, and comprehensive input validation across a seamless 4-page user journey.

## 🍕 Project Overview

SET Pizza Shop demonstrates modern e-commerce development practices through a fully functional online ordering system. The application showcases advanced web development techniques including AJAX-powered real-time calculations, multi-page state management, and comprehensive user experience design.

## 🛠️ Technologies Used

![ASP.NET](https://img.shields.io/badge/ASP.NET-5C2D91?style=for-the-badge&logo=.net&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)
![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

**Core Technologies:**
- **ASP.NET/PHP/ASP** - Server-side application framework and processing
- **JavaScript & jQuery** - Client-side interactivity and AJAX functionality
- **AJAX** - Asynchronous data exchange and real-time updates
- **CSS3** - Modern styling and responsive design
- **HTML5** - Semantic markup and web standards
- **Server-Side Programming** - Backend logic and data processing

## 🎯 Key Features

### 🏗️ Multi-Page Application Architecture
- **4-Page User Journey** - Seamless flow from registration to order confirmation
- **State Management** - Persistent data across multiple pages and sessions
- **Navigation Flow** - Intuitive user progression through ordering process
- **Session Continuity** - Maintained user context throughout application
- **Page Transitions** - Smooth navigation with preserved user data

### 💰 Real-Time Price Calculation
- **AJAX-Powered Updates** - Instant price calculations without page refreshes
- **Dynamic Pricing Engine** - Real-time total updates based on topping selections
- **Interactive Feedback** - Immediate visual confirmation of price changes
- **Asynchronous Processing** - Non-blocking user interface updates
- **Cost Transparency** - Clear breakdown of pricing components

### ✅ Comprehensive Input Validation
- **Dual Validation System** - Client-side and server-side validation implementation
- **Data Integrity** - Robust validation ensuring accurate order information
- **User-Friendly Messaging** - Clear error messages and validation feedback
- **Form Security** - Prevention of invalid or malicious input
- **Real-Time Feedback** - Immediate validation responses during user input

### 🛒 Interactive Order System
- **Checkbox-Based Selection** - Intuitive topping selection interface
- **Dynamic Menu Updates** - Real-time availability and pricing adjustments
- **Order Customization** - Flexible pizza configuration options
- **Selection Persistence** - Maintained choices across page transitions
- **Visual Confirmation** - Clear indication of selected items and totals

### 📋 Complete Order Management Flow
- **Customer Registration** - Name capture and user information collection
- **Product Selection** - Interactive pizza customization and topping selection
- **Order Review** - Comprehensive order summary and confirmation page
- **Final Acknowledgment** - Order completion confirmation and receipt
- **Process Validation** - Multi-step verification ensuring order accuracy

## 🏗️ Technical Architecture

### Frontend Implementation
```javascript
// Real-time price calculation example
function updatePrice() {
    let basePrice = parseFloat($('#basePizza').data('price'));
    let toppingsPrice = 0;
    
    $('.topping-checkbox:checked').each(function() {
        toppingsPrice += parseFloat($(this).data('price'));
    });
    
    let totalPrice = basePrice + toppingsPrice;
    $('#totalPrice').text('$' + totalPrice.toFixed(2));
}
```

### Server-Side Processing
```csharp
// ASP.NET session management example
public void ProcessOrder()
{
    if (Session["CustomerName"] != null)
    {
        Order order = new Order
        {
            CustomerName = Session["CustomerName"].ToString(),
            Toppings = GetSelectedToppings(),
            TotalPrice = CalculateTotal()
        };
        
        SaveOrder(order);
        Response.Redirect("confirmation.aspx");
    }
}
```

## 🚀 Core Functionality

### Page Flow Architecture
1. **Registration Page** - Customer information capture and validation
2. **Menu Selection** - Interactive pizza customization with real-time pricing
3. **Order Review** - Comprehensive order summary and final modifications
4. **Confirmation** - Order acknowledgment and completion confirmation

### AJAX Implementation
- **Asynchronous Requests** - Non-blocking server communication
- **Real-Time Updates** - Instant price calculations and menu updates
- **Error Handling** - Graceful degradation and user feedback
- **Performance Optimization** - Efficient client-server communication

### State Management
- **Session Persistence** - Customer data maintained across pages
- **Order Context** - Shopping cart functionality and item persistence
- **Navigation State** - Proper page flow and back-button handling
- **Data Integrity** - Consistent information throughout user journey

## 🎨 User Experience Design

### Visual Design
- **Consistent Styling** - External CSS with cohesive design system
- **Custom Color Scheme** - Professional branding and visual identity
- **Responsive Layout** - Cross-device compatibility and accessibility
- **Interactive Elements** - Hover effects and visual feedback
- **Professional Branding** - Corporate identity and brand consistency

### User Interface Features
- **Intuitive Navigation** - Clear user flow and action indicators
- **Visual Feedback** - Immediate response to user interactions
- **Error Prevention** - Proactive validation and user guidance
- **Accessibility** - Web standards compliance and usability
- **Mobile Responsiveness** - Optimized for various screen sizes

## 🔧 Technical Implementation

### Server-Side Architecture
- **Request Processing** - AJAX request handling and response generation
- **Data Validation** - Server-side input validation and sanitization
- **Session Management** - User state persistence and security
- **Order Processing** - Business logic and workflow management
- **Error Handling** - Comprehensive exception management

### Client-Side Development
- **Interactive Forms** - Dynamic form behavior and validation
- **AJAX Integration** - Seamless client-server communication
- **DOM Manipulation** - Real-time content updates and modifications
- **Event Handling** - User interaction processing and response
- **Performance Optimization** - Efficient script loading and execution

## 📊 Cross-Browser Compatibility

### Tested Browsers
- **Microsoft Edge** - Full functionality validation and testing
- **Google Chrome** - Complete feature compatibility verification
- **Cross-Platform Support** - Windows and web-based deployment
- **Standards Compliance** - HTML5 and CSS3 standard adherence
- **JavaScript Compatibility** - ES5/ES6 feature support across browsers

## 🔧 Installation & Setup

### Prerequisites
```bash
# For ASP.NET Version
- .NET Framework 4.7.2 or higher
- IIS or Visual Studio Development Server
- SQL Server or compatible database (optional)

# For PHP Version
- PHP 7.4 or higher
- Apache/Nginx web server
- MySQL database (optional)
```

### Deployment Options

#### ASP.NET Deployment
```bash
# Clone repository
git clone https://github.com/yourusername/set-pizza-shop.git
cd set-pizza-shop

# Open in Visual Studio
# Build and run with IIS Express
# Or deploy to IIS server
```

#### PHP Deployment
```bash
# Copy files to web server directory
cp -r set-pizza-shop/* /var/www/html/

# Set proper permissions
chmod 755 /var/www/html/set-pizza-shop/
chown www-data:www-data /var/www/html/set-pizza-shop/

# Access via browser
http://localhost/set-pizza-shop/
```

## 📁 Project Structure
```
SetPizzaShop/
├── Pages/
│   ├── registration.aspx/php    # Customer information capture
│   ├── menu.aspx/php           # Pizza selection and customization
│   ├── review.aspx/php         # Order review and confirmation
│   └── confirmation.aspx/php    # Final acknowledgment page
├── Scripts/
│   ├── jquery.min.js           # jQuery library
│   ├── pizza-calculator.js     # Price calculation logic
│   └── validation.js           # Form validation scripts
├── Styles/
│   ├── main.css               # Primary stylesheet
│   ├── forms.css              # Form-specific styling
│   └── responsive.css         # Mobile responsiveness
├── Images/
│   ├── logo.png               # Company branding
│   ├── pizzas/                # Pizza and topping images
│   └── icons/                 # UI icons and graphics
└── README.md                  # Project documentation
```

## 🎯 Skills Demonstrated

### Full-Stack Development
- **Frontend Development** - Interactive user interfaces with modern web technologies
- **Backend Programming** - Server-side logic and data processing
- **Database Integration** - Data persistence and session management
- **API Development** - AJAX endpoint creation and management

### E-commerce Expertise
- **Shopping Cart Functionality** - Order management and persistence
- **Payment Processing** - Price calculation and order totaling
- **User Journey Design** - Multi-step checkout process optimization
- **Order Management** - Complete order lifecycle implementation

### Web Technologies
- **AJAX Programming** - Asynchronous web application development
- **State Management** - Session handling and data persistence
- **Client-Side Scripting** - JavaScript and jQuery implementation
- **Responsive Design** - Cross-device compatibility and optimization

### Software Engineering
- **Multi-Page Architecture** - Complex application structure and navigation
- **Input Validation** - Data integrity and security implementation
- **Error Handling** - Graceful degradation and user feedback
- **Cross-Browser Testing** - Compatibility validation and optimization

## 📈 Technical Achievements

- **Zero Page Refreshes** - Seamless AJAX-powered user experience
- **Real-Time Calculations** - Instant price updates and feedback
- **Cross-Browser Support** - 100% compatibility across modern browsers
- **Session Persistence** - Reliable state management across page transitions
- **Professional UI/UX** - Consistent branding and user-centered design

---

**Project Status**: Completed  
**Development Type**: Individual Academic Project  
**Architecture**: Multi-Page Web Application  
**Role**: Full-Stack Web Developer
