<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        wrap {
            display: grid;
            grid-template-rows: 50px auto;
            grid-template-areas:
                "logo"
                "main";
        }

        logo {
            grid-area: logo;
            width: 100%;
        }

        header img {
            width: 200px;
            height: 50px;
        }

        main {
            grid-area: main;
            width: 100%;
            height: 900px;
            display: flex;
            justify-content: center;
            /* 내부 요소들을 수평으로 가운데 정렬 */
        }


        main>div:first-child {
            margin-top: 500px;
            width: 300px;
        }

        main>div:nth-child(2) {
            width: 329px;
            margin-top: 200px;
        }

        main>div:nth-child(3) {
            width: 500px;
            margin-top: 150px;
        }

        input {
            width: 400px;
            height: 60px;
            background-color: #EFFFF2;
            border: none;
            border-radius: 30px;
            padding: 0 20px;
            margin-top: 20px;
            font-size: 18px;
            outline: none;
            /* 포커스 효과 제거 */
        }

        input::placeholder {
            color: #888;
            /* placeholder 텍스트 색상 */
        }

        input:focus {
            background-color: #D4F5E9;
            /* 포커스 시 배경색 변경 */
            border: 2px solid #48BB78;
            /* 포커스 시 테두리 스타일 변경 */
        }

        input[type="submit"] {
            width: 400px;
            height: 60px;
            background-color: #48BB78;
            color: white;
            border: none;
            border-radius: 30px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #38A169;
        }
    </style>
</head>

<body>
    <wrap>
        <header>
            <img src="./img/logo.png">
        </header>
        <main>
            <div>


                <h1>회원가입</h1>
                <h2>Wellness Road</h2>
                <br>
                <h3>이미 등록된 아이디가 있다면</h3>
                <h3><b><a href="login.html">여기를!</a></b> 누르세요!</h3>
            </div>
            <div><img src="./img/loginpeople.png"></div>
            <div>
                <br><br>
                <form action="">
                    <h1>회원가입</h1>
                    <input type="text" placeholder="Enter ID"> <br>
                    <input type="text" placeholder="Enter NickName"> <br>
                    <input type="text" placeholder="Enter Email"> <br>
                    <input type="password" placeholder="password"> <br>
                    <input type="password" placeholder="Confirm password"> <br>
                    <input type="submit" value="Register">
                </form>
            </div>
        </main>
    </wrap>
</body>

</html>