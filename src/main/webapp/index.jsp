<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI 질문 인터페이스</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        #chatbox {
            height: 300px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            margin-bottom: 10px;
            padding: 10px;
        }
        #user-input {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
        }
        #send-button {
            width: 100%;
            padding: 10px;
            background-color: #e0a250;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>나는야 대현자 옥지</h1>
    <img src="https://img1.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202403/22/notepet/20240322113011715nzkd.webp" alt="옥지 산책하러감밍~ㄴ" width: full;"/>
    
    
    <div id="chatbox"></div>
    <input type="text" id="user-input" placeholder="질문을 입력하세요...">
    <button id="send-button">엔터를 눌러주시개</button>

    <script>

    document.getElementById('send-button').addEventListener('click', function() {
        var question = document.getElementById('user-input').value;
        if (question.trim() !== '') {
            // 사용자 질문을 채팅창에 추가
            document.getElementById('chatbox').innerHTML += '<p><strong>사용자:</strong> ' + question + '</p>';
            
            fetch('http://localhost:9090/ai?message=' + encodeURIComponent(question), {
                method: 'GET'
            })
            .then(response => response.text())
            .then(data => {
                // 서버 응답을 채팅창에 추가
                document.getElementById('chatbox').innerHTML += '<p><strong>대현자 옥지:</strong> ' + data + '</p>';
                document.getElementById('user-input').value = '';
            });
        }
    });
    </script>
</body>
</html>