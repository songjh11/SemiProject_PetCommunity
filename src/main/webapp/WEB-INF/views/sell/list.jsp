<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

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

  <!-- header start -->
  <c:import url="/WEB-INF/views/template/header.jsp"></c:import>
  <!-- header end -->

  
    <!-- ======= List Section ======= -->

    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">
                   <section id="book-a-table" class="book-a-table">
                    <div class="container" data-aos="fade-up">
                    <section id="menu" class="menu">
                      <div class="section-header">
                        <p><span>${category.categoryName}</span><p>
                       </div>
                   <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="200">
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=1">
                            <h4>Hoteling</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=2">
                            <h4>Ondday</h4>
                          </a>
                        </li><!-- End tab nav item -->
                        <li class="nav-item">
                          <a class="nav-link" href="/sell/list?itemCatg=3">
                            <h4>Traning</h4>
                          </a>
                        </li><!-- End tab nav item -->
    
              
                        </ul>
                        </section>
                      </section>
                        </div>
                   
					<div class="row gy-1">	
              <c:forEach items="${list}" var="ar">
                <div class="col-lg-3 col-md-4 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                  <div class="chef-member" style="width: 250px; height: 350px; margin-bottom: 15px;">
                    <div class="member-img" style="width: 100%;">
                      <img src="/resources/upload/sellfile/${ar.fileDTOs[0].fileName}" class="img-fluid" alt="">
                      <div class="social d-flex">
                        <button type="button" class="btnsocial" id="btnPick">
                          <i class="bi bi-balloon-heart btnPick" style="cursor: pointer;" data-item-num="${ar.itemNum}"></i>
                        </button>
                          <i class="bi bi-facebook" style="cursor: pointer;" id="btnShopCart"></i></a>
                        </p>
                      </div>
                    </div>
                    <div class="member-info" style="width: 100%; height: 115px;">
                      <h4><a href="./detail?itemNum=${ar.itemNum}">${ar.itemName}</a></h4>
                      <!-- <p>${ar.itemAddress}</p> -->
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
  <script src="/resources/JS/pick&shopcart.js"></script>

  <script>
    const btnPick = document.getElementById("btnPick");
    
    btnPick.addEventListener("click", function(){
      선택자.classList.remove('삭제할 클래스명')
      선택자.classList.add('추가할클래스명')  

    })
  </script>
</body>

</html>