<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<script type="text/javascript">
			function formCheck() {
				if (frm.memberPassword.value != frm.memberPassword1.value) {
					alert("패스워드가 일치하지 않습니다.");
					frm.memberPassword1.value = null;
					frm.memberPassword1.focus();
					return false;
				}
				return true;
			}
			</script>

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
									<h3 class="text-center font-weight-light my-4">Forget Password?</h3>
								</div>
								<div class="card-body">
									<!-- 수정 -->
									<form id="frm" name="frm" onsubmit="return formCheck()" action="passwordReset.do" method="post">
										<div class="form-group">
											<label class="small mb-1" for="inputId">ID</label> <input
												class="form-control py-4" id="memberId" name="memberId"
												type="text" placeholder="Enter ID" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputName">NAME</label> <input
												class="form-control py-4" id="memberName" name="memberName"
												type="text" placeholder="Enter NAME" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPhone">PHONE</label> <input
												class="form-control py-4" id="memberPhone"
												name="memberPhone" type="text" placeholder="Enter PHONE" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputEmail">EMAIL</label> <input
												class="form-control py-4" id="memberEmail"
												name="memberEmail" type="text" placeholder="Enter EMAIL" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPassword">RESET PASSWORD</label> <input
												class="form-control py-4" id="memberPassword"
												name="memberPassword" type="password" placeholder="Enter RESET PASSWORD" />
										</div>
										<div class="form-group">
											<label class="small mb-1" for="inputPassword Check">PASSWORD CHECK</label> <input
												class="form-control py-4" id="memberPassword1"
												name="memberPassword1" type="password" placeholder="Enter PASSWORD CHECK" />
										</div>
										<div class="form-group d-flex align-items-center justify-content-between mt-2 mb-0">
											<a class="small" href="main.do">Want go Home?</a>
											<button class="btn btn-primary" type="submit">Password Reset</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="js/scripts.js"></script>
</body>
</html>