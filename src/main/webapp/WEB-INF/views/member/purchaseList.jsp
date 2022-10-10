<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>list page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/main.css" rel="stylesheet">

	<style type="text/css">
    .ag{
      background-color:cornsilk;
      overflow: scroll;
      width: 600px;
      height: 100px;
    }

    .warning{
      color: red;
    }
    #po{
      font-size: 10pt;
      color: darkgray;
    }


    #imgDiv{
      display: flex;
    }

    .newDiv{
      justify-content: center;
      align-items:center;
      position: relative;
      width: 80px;
	  	height: 80px;
      margin-right: 5px;
    }
    .thumnail{
		width: 80px;
		height: 80px;

		} 
    .imgDeleteBtn {
      position: absolute;
      top: 0px;
      right: 0px;
    }

    #inputDiv{
      display: none;
    }
	</style>
  
</head>
<body>
<!-- header start -->
<c:import url="/WEB-INF/views/template/header.jsp"></c:import>
<!-- header end -->
<!-- ======= Follow Section ======= -->

    <section id="chefs" class="chefs section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>apage</span></p>
        </div>

        <div class="row gy-4">

            <c:choose>
            <c:when test="${what eq 'checkList'}">
                    <c:forEach items="${checkList}" var="check">
                      <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                          <div class="chef-member">
                              <div class="member-img">
                                  <img src="/resources/upload/sellfile/${check.fileDTOs[0].fileName}" class="img-fluid" alt="">
                                  <div class="social">
                                  <a href=""><i class="bi bi-trash3"></i></a>
                                  <a href=""><i class="bi bi-facebook"></i></a>
                                  <a href=""><i class="bi bi-instagram"></i></a>
                                  <a href=""><i class="bi bi-linkedin"></i></a>
                                  </div>
                              </div>
                              <div class="member-info">
                                  <h4>${check.itemDTO.itemName}</h4>
                                  <a href="./purchaseDetail?merchant_uid=${check.merchant_uid}">주문번호: ${check.merchant_uid}</a>
                                  <span>결제 금액: ${check.amount}</span>
                                  <p>${itemDTOs.itemContents}</p>
                              </div>
                          </div>
                      </div>
                  </c:forEach>
                </c:when>
            </c:choose>
        </div>
      </div>
    </section>


  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

<script src="/resources/JS/follow.js"></script>

</body>
</html>