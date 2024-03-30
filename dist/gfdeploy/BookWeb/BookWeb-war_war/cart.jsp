<%-- 
    Document   : cart
    Created on : Mar 27, 2024, 4:45:41 PM
    Author     : a
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-+wjA9R3NqLkhtKo2lE3d/XQX7g25Yl0ZM6DgQRHY0O8Zvhu98FCP9+PmALwP2bXjUHbAv5xhbm9bJUCg6MvWmw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>BookStore</title>
        <style>
            .card {
                width: calc(33.33% - 4rem);
                margin-bottom: 2rem;

            }

            @media (max-width: 992px) {
                .card {
                    width: calc(50% - 1rem);
                }
            }

            @media (max-width: 576px) {
                .card {
                    width: calc(100% - 1rem);
                }
            }
            header {
                background-color: #333;
                color: #fff;
                padding: 1rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header-title {
                font-size: 1.5rem;
                text-transform: uppercase;
                padding-left: 30px;
            }

            .header-icon {
                font-size: 1.5rem;
                position: relative;
                cursor: pointer;
                padding-right: 120px;
            }

            .header-icon img {
                width: 24px;
                height: 24px;
                vertical-align: middle;
                filter: invert(100%);
            }

            .cart-count {
                position: absolute;
                top: -8px;
                right: -8px;
                background-color: red;
                color: white;
                border-radius: 50%;
                width: 20px;
                height: 20px;
                font-size: 0.8rem;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .container {
                max-width: 800px;
                margin: auto;
            }

            .shopping-cart {
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
            }

            .shopping-cart h2 {
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }

            .product {
                border-bottom: 1px solid #eee;
                padding: 20px 0;
            }

            .product img {
                max-width: 100px;
                height: auto;
            }

            .product-info {
                padding-left: 20px;
            }

            .product-info h3 {
                margin-bottom: 10px;
                font-size: 18px;
                color: #333;
            }

            .product-info p {
                font-size: 14px;
                color: #666;
                margin-bottom: 5px;
            }

            .quantity {
                width: 50px;
                text-align: center;
            }

            .total {
                font-weight: bold;
            }

            .remove-product {
                color: red;
                cursor: pointer;
            }

            .remove-product:hover {
                text-decoration: underline;
            }

            .btn-update {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 5px 10px;
                border-radius: 3px;
                cursor: pointer;
            }

            .btn-update:hover {
                background-color: #0056b3;
            }

            .btn-checkout {
                background-color: #28a745;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
            }

            .btn-checkout:hover {
                background-color: #218838;
            }
            .checkout-css {
                display: flex;
                justify-content: flex-end;
                margin-top: 10px;
            }

            .modal-header { 
                justify-content: space-between;
            }

           
            .design-btn  {
                width: 100%;
                padding: 10px;
                margin: 10px;
            }
            

        </style>
    </head>
    <body>
        <header>
            <div class="header-title">
                <a href="ControllerBook">Home</a>
            </div>
            <div class="header-icon">
                <a href="cart.jsp"><img src="imgs\\grocery-store.png" alt="Giỏ hàng"></a> 
            </div>
        </header>
        <div class="container">
            <div class="shopping-cart">
                <h2>Shopping Cart</h2>
                <c:forEach items="${carts}" var="ca">
                    <div class="product">
                        <div class="row">
                            <div class="col-md-3">
                                <img src="${ca.img}" alt="Product Image">
                            </div>
                            <div class="col-md-9 product-info">
                                <h3>${ca.tenSach}</h3>
                                <p>Giá: $${ca.giaBan}</p>
                                <p>Quantity: <input id="quantityInput" class="quantity form-control" type="number" value="${ca.soLuong}"></p>
                                <p class="total">Total: $${ca.tongTien}</p>
                                <a href="ControllerBook?maSach=${ca.maSach}&action=RemoveFromCart"><p class="remove-product">Remove</p></a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- More products can be added here -->

            </div>
           <c:if test="${not empty carts}">
            <div class="checkout-css">
                <button class="btn btn-checkout">Checkout</button>
            </div>
            </c:if>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="checkoutModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="checkoutModalLabel">Checkout Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="checkoutForm" action="ControllerBook?action=PlaceOrder" method="post">
                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" class="form-control" id="name" name="name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number:</label>
                                <input type="phone" class="form-control" id="phone" name="phone" required>
                            </div>
                            <div class="form-group">
                                <label for="address">Address:</label>
                                <textarea class="form-control" id="address" name="address" rows="4" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="cvv">Tổng Tiền($):</label>
                                <input type="text" class="form-control" id="money" name="money" value="${total}">
                            </div>
                            <div class="form-group">
                                <label for="paymentMethod">Payment Method:</label>
                                <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                                    <option value="">-- Select Payment Method --</option>
                                    <option value="creditCard">Credit Card</option>
                                    <option value="paypal">PayPal</option>
                                    <option value="cash">Cash</option>
                                </select>
                            </div>
                            <div id="creditCardForm" style="display: none;">
                                <h5>Enter Credit Card Information:</h5>
                                <div class="form-group">
                                    <label for="cardNumber">Card Number:</label>
                                    <input type="text" class="form-control" id="cardNumber" name="cardNumber">
                                </div>
                                <div class="form-group">
                                    <label for="expiryDate">Expiry Date:</label>
                                    <input type="text" class="form-control" id="expiryDate" name="expiryDate">
                                </div>
                                <div class="form-group">
                                    <label for="cvv">CVV:</label>
                                    <input type="text" class="form-control" id="cvv" name="cvv">
                                </div>

                            </div>
                           
                                <button type="submit" class="design-btn  btn btn-primary">Place Order</button>

                          

                        </form>
                    </div>
                </div>
            </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $(".btn-checkout").click(function () {
                    $("#checkoutModal").modal();
                });

                
            });
        </script>
        <script>
            $("#paymentMethod").change(function () {
                var paymentMethod = $(this).val();
                if (paymentMethod === "creditCard") {
                    $("#creditCardForm").show();
                } else {
                    $("#creditCardForm").hide();
                }
            });
        </script>
    </body>
</html>
