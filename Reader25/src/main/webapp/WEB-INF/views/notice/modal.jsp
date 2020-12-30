<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
       #test_page p {
            width: 900px;
       } 
  </style>
</head>
<body>
	<div id="test_page">
    <p>
        Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sint nisi voluptatem iusto beatae sequi ex quam tempora laboriosam facere, facilis nulla nostrum impedit ducimus, porro quasi quos, itaque optio corporis.
    </p>

    <div class="text-center">
        <button id="close_btn" type="button" class="btn btn-danger btn-lg">닫기</button>
    </div>

    <script>
        var base = $('#test_page').parents('.modal_popup');

        $('#close_btn', base).on('click', function() {
            // 창 닫을때 부모창으로 값 넘기기
            $.modal.getCurrent().close({ x: '333333' });
        });
    </script>
</div>
</body>
</html>