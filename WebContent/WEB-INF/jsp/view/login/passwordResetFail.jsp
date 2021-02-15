<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Page Title - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js"
	crossorigin="anonymous"></script>

</head>
<body class="bg-primary">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Password Reset Fail</h3>
								</div>
								<div class="card-body">
									<div align="center">
										<h3>${param.memberId } 님이 비밀번호초기화에 실패하셨습니다.</h3>
										<button class="btn btn-primary" type="button"
											onclick="location.href='passwordForgotForm.do'">재시도</button>
										<button class="btn btn-primary" type="button"
											onclick="location.href='main.do'">홈으로</button>
									</div>
								</div>
								<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
									crossorigin="anonymous"></script>
								<script
									src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
									crossorigin="anonymous"></script>
								<script src="js/scripts.js"></script>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
</html>