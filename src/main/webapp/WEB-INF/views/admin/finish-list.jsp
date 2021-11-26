<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/finish-list.css">
</head>
<body>
   <div class='main'>
   
      <!-- 사이트 메뉴(조회해협 & MY 해협) -->
      <!-- <aside> -->
      <div class='aside'>
         <button class="join_list" onclick="location.href='/admin/join-request'">가입 요청</button>
         <button class="revision_list" onclick="location.href='/admin/modify-request'">수정 요청</button>
         <button class="finished_list" onclick="location.href='/admin/finish-list'">완료 목록</button>
      </div>
      <!-- </aside> -->
      <div class='section'>
         <div class='wrapper'>
            <div class='select_wrapper'>
               <div class='sub_menu'>
                  <!-- 현재 선택된 메뉴에 selected class를 추가해주면 자동으로 css 바뀝니다!! -->
                  <div><button class='selected'>승인</button></div>
                  <div><button>거절</button></div>
               </div>
               <div class='desc'>* 최근 3일 이내에 승인된 업체 목록입니다.</div>
            </div>
            <div class='wrap_list'>
               <div class='list'>
                  <table>
                     <thead>
                        <tr>
                           <th>구분</th>
                           <th>아이디</th>
                           <th>업체명</th>
                           <th>요청일</th>
                           <th>승인일</th>
                           <th>승인취소</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr><td>가입</td><td>syaanc</td><td>싱크싱크</td><td>2021/10/16</td><td>2021/10/17</td><td><button class='cancel'>취소</button></td>
                        <tr><td>가입</td><td>Wqqw</td><td>뚫어뚫어</td><td>2021/10/16</td><td>2021/10/17</td><td><button class='cancel'>취소</button></td>
                        <tr><td>수정</td><td>sync</td><td>싱크싱크</td><td>2021/10/16</td><td>2021/10/17</td><td><button class='cancel'>취소</button></td>
                        <tr><td>가입</td><td>sync</td><td>싱크싱크</td><td>2021/10/16</td><td>2021/10/17</td><td><button class='cancel'>취소</button></td>
                     </tbody>
                  </table>
               </div>
               <div class='page'>
                  <i class="fas fa-caret-left"></i>
                  <div><span>1</span><span>2</span><span>3</span><span>4</span><span>5</span></div>
                  <i class="fas fa-caret-right"></i>
               </div>
            </div>
         </div>
      </div>
   </div>
   
      
</body>
</html>