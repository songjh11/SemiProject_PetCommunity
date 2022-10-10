<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Add Item</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

	<style type="text/css">
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
<!-- ======= Add Items Section ======= -->
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <p><span>Add Item</span></p>
        </div>

          <div class="col-lg-8 align-items-center">
            <form action="add" method="post" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" id="addItemFrm">
              <div class="row gy-4">
                <div class="col-lg-8 col-md-12">
                  <input type="text" name="userId" class="form-control" id="userId" value="${member.userId}" readonly>
                  <div class="validate"></div>
                </div>
                <div class="col-lg-8 col-md-6">
                  <input type="text" class="form-control" name="itemName" id="itemName" placeholder="Item Name">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-4 col-md-6">
                   <button type="button" id="sellfileAdd">상품 사진 추가</button>
                  </div>
                <div class="col-lg-4 col-md-6">  
                <div id="sellFileImages">
                  <div id= "inputDiv"></div>
                  <div id = "imgDiv"></div>
                </div>
                </div>
                             
                <div class="col-lg-12 col-md-12">
                  <input type="text" class="form-control" name="itemPrice" id="itemPrice" placeholder="Item Price">
                  <div class="validate"></div>
                </div>
                <div class="form-group mt-3">
	                <textarea class="form-control" name="itemContents" rows="5" placeholder="Item Contents"></textarea>
	                <div class="validate"></div>
                </div>
                
                <div class="col-lg-6 col-md-6">
                 <input type="text" name="itemZipCode"  class="form-control" id="itemZipCode" placeholder="우편번호">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-6 col-md-6">
                  <button type="button" id="address_kakao" onclick="execDaumPostcode();">주소 검색</button>
                </div>
                <div class="col-lg-12 col-md-12">
                 <input type="text" name="itemAddress" class="form-control" id="itemAddress" placeholder="주소">
                </div>
                <div class="col-lg-12 col-md-12">
                  <input type="text" name="itemDeAddress" class="form-control" id="itemDeAddress" placeholder="상세 주소">
                  <div class="validate"></div>
                </div>
                <div class="col-lg-4 col-md-6">
                  <select name="itemCatg" class="form-control" id="itemCatg">
                    <option value='' selected>-- 상품 카테고리 선택 --</option>
                    <option value="1">호텔링</option>
                    <option value="2">원데이클래스</option>
                    <option value="3">트레이닝</option>
                  </select>
                  <div class="validate"></div>
                </div>
              </div>
              <br>
             <div class="text-center">
             	<button type="button" id="addItemBtn">상품 등록</button>
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
                    document.getElementById("itemAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('itemZipCode').value = data.zonecode;
                document.getElementById("itemAddress").value = addr += extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("itemDeAddress").focus();
            }
        }).open();
    }//kakao api 끝
</script>

<script src="/resources/JS/sellAdd.js"></script>
  
</body>
</html>