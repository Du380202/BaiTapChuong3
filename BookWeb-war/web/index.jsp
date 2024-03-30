<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-+wjA9R3NqLkhtKo2lE3d/XQX7g25Yl0ZM6DgQRHY0O8Zvhu98FCP9+PmALwP2bXjUHbAv5xhbm9bJUCg6MvWmw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>BookStore</title>
        <style>
            .container {
                display: flex;
                
                align-items: center;
                flex-wrap: wrap;
                padding: 0 1rem;
                height: 100%;
            }




            .card {
                width: calc(33.33% - 4rem);
                margin-bottom: 4rem;
                margin-left: 4rem;
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
                /* Màu nền header */
                color: #fff;
                /* Màu chữ */
                padding: 1rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header-title {
                font-size: 1.5rem;
                text-transform: uppercase;
                /* Kích thước font chữ tiêu đề */
                padding-left: 30px;
            }

            .header-icon {
                font-size: 1.5rem;
                /* Kích thước font chữ biểu tượng giỏ hàng */
                position: relative;
                cursor: pointer;
                padding-right: 120px;
            }

            .header-icon img {
                width: 24px;
                /* Kích thước biểu tượng giỏ hàng */
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
            
           
        </style>
    </head>
    <body>
        <header>
            <div class="header-title">
                Danh sách sản phẩm
            </div>
            <div class="header-icon">
                <a href="ControllerBook?action=viewCart"><img src="imgs\\grocery-store.png" alt="Giỏ hàng"></a> <!-- Thay thế đường dẫn của hình ảnh shopping cart -->
            </div>
        </header>
        <div class="container p-5">
           
                <c:forEach items="${books}" var="book">
     
                    <div class="col-3 card border-0 rounded-0 shadow">
                 
                        <img src="${book.img}" class="card-img-top rounded-0" alt="...">
                        <div class="card-body my-3">
                            <div class="row">
                                <div class="col-10">
                                    <h4 class="card-title">${book.tenSach}</h4>
                                    <p class="card-text">Số Lượng: ${book.soLuong}</p>

                                </div>
                                <div class="col-2"></div>
                            </div>
                        </div>
                        <div class="row align-items-center text-center g-0">
                            <div class="col-4">$${book.giaBan}</div>
                            <div class="col-8">
                                <a href="ControllerBook?maSach=${book.maSach}&action=AddCart" class="btn btn-dark text-warning p-3 w-100 
                                   rounded-0">ADD TO CART</a>

                            </div>
                        </div>
                    </div>
                </c:forEach>
        </div>
    </body>
</html>
