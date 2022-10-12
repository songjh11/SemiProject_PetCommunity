<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Update page</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	<style type="text/css">
    .col{
      background-color:cornsilk;
      overflow: scroll;
      width: 600px;
      height: 100px;
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
<!-- ======= Join Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Update page</span></p>
        </div>
  

          <div class="col-lg-8 align-items-center">
            <form action="update" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="updatefrm">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="hidden" name="roleNum" value="${dto.roleNum}">
                  <input type="text" name="userId" class="form-control" value="${dto.userId}" readonly>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="password" name="password" class="form-control" value="${dto.password}" placeholder="password" id="password">
                  <div id="d2" class="warning"></div>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userName" class="form-control" value="${dto.userName}" placeholder="User Name" id="userName">
                  <div id="d3" class="warning"></div>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="number" name="phone" class="form-control" value="${dto.phone}" placeholder="Phone" id="phone">
                  <div id="d4" class="warning"></div>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-12">
                  <input type="email" name="email" class="form-control" value="${dto.email}" placeholder="Email" id="email">
                  <div id="d5" class="warning"></div>
                  <div class="validate"></div>
                </div>

                <div class="col-lg-6 col-md-6">
                  <input type="text" name="itemZipCode" class="form-control" id="itemZipCode" value="${dto.itemZipCode}" placeholder="주소검색">
                   <div class="validate"></div>
                 </div>
                 <div class="col-lg-6 col-md-6">
                   <button type="button" id="address_kakao" onclick="execDaumPostcode();">주소 검색</button>
                 </div>
                 <div class="col-lg-12 col-md-12">
                  <input type="text" name="address" class="form-control" id="address" value="${dto.address}" placeholder="Address">
                 </div>
                 <div class="col-lg-12 col-md-12">
                   <input type="text" name="deAddress" class="form-control" id="deAddress" value="${dto.deAddress}" placeholder="상세주소">
                   <div class="validate"></div>
                 </div>

                </div>
                
               
             
                <c:if test="${dto.roleNum == '2'}">

                  <div class="col-lg-8 col-md-12">
                    <input type="text" class="form-control" name="petCatg" value="${dto.petCatg}" placeholder="Pet Categori">
                    <div class="validate"></div>
                  </div>

                  <div class="col-lg-8 col-md-12">
                    <input type="text" class="form-control" name="petName" value="${dto.petName}" placeholder="Pet Name">
                    <div class="validate"></div>
                  </div>

                  <div class="col-lg-8 col-md-12">
                    <input type="file" class="form-control" name="photo" id="files" value="${dto.memberFileDTO.oriName}">
                    <div class="validate"></div>
                  </div>

                </c:if>
                메시지 동의 약관(선택) <input type="radio" class="cb" name="agMes" id="radiomes" value="1"> 


              
                
              
              
              </div>
              <br>
             <div class="text-center">
             	<button type="button" id="update" class="btn-book-a-table">수정완료</button>
             </div>
             
            </form>
          </div><!-- End Reservation Form -->

        </div>

    </section><!-- End Add Items Section -->



  <!-- footer start -->
  <c:import url="/WEB-INF/views/template/footer.jsp"></c:import>
  <!-- footer end -->

<!-- daum 지도 검색 api -->  
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
        function execDaumPostcode() {
          new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("itemLongtitude").value = extraAddr;
                
                } else {
                    document.getElementById("address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('itemZipCode').value = data.zonecode;
                document.getElementById("address").value = addr += extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("deAddress").focus();
            }
        }).open();
    }//kakao api 끝
</script>

<script src="/resources/JS/update.js"></script>

</body>
</html>