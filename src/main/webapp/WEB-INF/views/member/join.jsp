<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>join page</h1>

<form id="form" action="./join" method="POST" enctype="multipart/form-data">
    
    USERID,USERNAME,PASSWORD,EMAIL,PHONE,ADDRESS

  <div class="row mb-3">
     <label for="inputUserID" class="col-sm-2 col-form-label">ID</label>
     <div class="col-sm-10">
       <input type="text" name="userId" class="form-control" id="inputUserID" placeholder="ID 입력">
   </div>

   <div class="row mb-3">
    <label for="inputUserName" class="col-sm-2 col-form-label">name</label>
    <div class="col-sm-10">
      <input type="text" name="userName" class="form-control" id="inputUserName" placeholder="name 입력">
  </div>

   <div class="row mb-3">
     <label for="inputPassword" class="col-sm-2 col-form-label">Password</label>
     <div class="col-sm-10">
       <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password 입력">
   </div>

   <div class="row mb-3">
     <label for="inputEmail" class="col-sm-2 col-form-label">Email</label>
     <div class="col-sm-10">
       <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email 입력">
   </div>

   <div class="row mb-3">
     <label for="inputPhone" class="col-sm-2 col-form-label">Phone</label>
     <div class="col-sm-10">
       <input type="text" name="phone" class="form-control" id="inputPhone" placeholder="전화번호 입력">
   </div>

   <div class="row mb-3">
    <label for="inputAddress" class="col-sm-2 col-form-label">adr</label>
    <div class="col-sm-10">
      <input type="text" name="address" class="form-control" id="inputAddress" placeholder="주소 입력">
  </div>

   <div class="row justify-content-end">
       <div >
           <button type="submit" class="btn btn-primary mb-3" id="btn">Sign in</button>
       </div>
   </div>
 </form>
</body>
</html>