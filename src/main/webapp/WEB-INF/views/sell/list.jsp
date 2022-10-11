<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

  <title>${category.categoryName}</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

    <style>
      .pagination{
        justify-content: center;
      }

      .pagination > li > a {
        float: none;
      }


    .page-link {
      color: rgb(98, 91, 91); 
      background-color: #fff;
      border: 1px solid #ccc; 
    }

    .page-item.active .page-link {
    z-index: 1;
    color: rgb(228, 145, 145);
    font-weight:bold;
    background-color: #f1f1f1;
    border-color: #ccc;
    
    }

    .page-link:focus, .page-link:hover {
      color: rgb(238, 8, 8);
      background-color: #fafafa; 
      border-color: #ccc;
    }

    .btnsocial{
      border: 0px;  
      outline: 0px;
      background-color: transparent;
    }

    .img-fluid{
      height: 250px;
    }

    </style>

</head>

<body>
  <div class="headerWrapper" style="position: relative;">
    <!-- header start -->
    <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
    <!-- header end -->
  </div>

    <!-- ======= List Section ======= -->

    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">
                   <section id="book-a-table" class="book-a-table">
                    <div class="container" data-aos="fade-up">
                    <section id="menu" class="menu">
                      <div class="section-header">
                        <p><span>${category.categoryName}</span><p>
                          <input type="hidden" value="${pager.itemCatg}">
                       </div>
                       <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=1">
                            <h4>Hotelling</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=2">
                            <h4>One day Class</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=3">
                            <h4>Training</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        </ul>
                        </section>
                      </div>
                      </section>
   
                   
					<div class="row gy-1">	
              <c:forEach items="${list}" var="ar">
                <div class="col-lg-3 col-md-4 d-flex align-items-stretch justify-content-center" data-aos="fade-up" data-aos-delay="100">
                  <div class="chef-member" style="width: 250px; height: 350px; margin-bottom: 15px;">
                    <div class="member-img" style="width: 100%;">
                      <img src="/resources/upload/sellfile/${ar.fileDTOs[0].fileName}" class="img-fluid" alt="">
                      <div class="social d-flex">
                        <button type="button" class="btnsocial" id="btnPick">
                          <i class="bi bi-bag-heart btnPick" style="cursor: pointer;" data-item-num="${ar.itemNum}"></i>
                        </button>
                        <button type="button">
                          <i class="bi bi-facebook" style="cursor: pointer;" id="btnShopCart"></i>
                        </button>
                      </div>
                    </div>
                    <div class="member-info" style="width: 100%; height: 115px;">
                      <h4><a href="./detail?itemNum=${ar.itemNum}">${ar.itemName}</a></h4>
                      <span>₩ ${ar.itemPrice}</span>
                    </div>
                  </div>
                </div>
              </c:forEach>
          </div>
        <!-- End grid1div -->
      </div>
    </section> 
    
    <!-- pagination start -->
    <div class="chefs section-bg" style="padding-bottom: 10px;">
      <nav aria-label="Page navigation example">
        <ul class="pagination">
          <li class="page-item ${sellPager.pre?'':'disabled'}">
            <a class="page-link" href="./list?page=${sellPager.startNum-1}&itemCatg=${sellPager.itemCatg}&search=${sellPager.search}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <c:forEach begin="${sellPager.startNum}" end="${sellPager.lastNum}" var="i">
            <li class="page-item"><a class="page-link" href="./list?page=${i}&itemCatg=${sellPager.itemCatg}&search=${sellPager.search}"> ${i}</a> </li>
          </c:forEach>
          <li class="page-item ${pager.next?'':'disabled'}">
            <a class="page-link" href="./list.do?page=${sellPager.lastNum+1}&itemCatg=${sellPager.itemCatg}&search=${sellPager.search}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
    <!-- pagination end -->        



 <!-- footer start -->
 <section>
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
</section>
<!-- footer end -->

  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
  <script src="/resources/JS/pick&shopcart.js"></script>
</body>

</html>