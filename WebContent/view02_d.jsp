<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>로그인/메인 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	background-color: #2c3e50;
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 900px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #ffffff;
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

}
table {
	text-align: center;
}

form {
	display: inline;
}

caption {
	text-align: center;
}

hr {
	border: none;
	border-top: 1px dotted;
	color: #18bc9c;
	width: 60%;
}

.ui {
	background-color: white;
	color: #0f705d;
	border: 2px solid #18bc9c;
	border-radius: 8px;
	font-size: 16px;
}

#joinbutton {
	width: 170px
}

#group_create {
	width: 170px
}

#group_search {
	width: 170px
}

#accordion .content {
	display: none;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"
	type="text/javascript"></script>

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="clickLogo.do"> <img
					src="logogo.bmp" width="100" height="35">
				</a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-5">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i><font
							size="4px" color="#ffffff">${user_id} 회원님</font><b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="myData.do"><i
									class="glyphicon glyphicon-user"></i> 마이 페이지</a></li>
							<li class="divider"></li>
							<li><a href="userLogut.do"><i
									class="glyphicon glyphicon-log-out"></i> 로그아웃</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<div class="col-sm-2 sidenav">
				<br> <br> <a href="#demo" class="btn btn-primary "
					id="joinbutton" data-toggle="collapse">모임 조회하기</a>
				<div id="demo" class="collapse" align="center">
					<br>
					<form action="searchGroup.do" method="get">
						<b>카테고리</b> : <input type="radio" name="interest" value="여행"><font
							color="#0f705d"><b>여행 </b></font> <input type="radio"
							name="interest" value="친목"><font color="#0f705d"><b>친목
						</b></font> <input type="radio" name="interest" value="문화"><font
							color="#0f705d"><b>문화 </b></font> <input type="radio"
							name="interest" value="운동"><font color="#0f705d"><b>운동</b></font>
						<input type="radio" name="interest" value="스터디"><font
							color="#0f705d"><b>스터디 </b></font><br> <br> <b>지역</b> :
						<select name="address" class="ui">
							<option value="서울">서울
							<option value="경기도">경기도
							<option value="강원도">강원도
							<option value="충청북도">충청북도
							<option value="충청남도">충청남도
							<option value="전라북도">전라북도
							<option value="전라남도">전라남도
							<option value="경상북도">경상북도
							<option value="경상남도">경상남도
							<option value="제주도">제주도
						</select><br> <br> <b>요일</b> : <input type="radio" name="day"
							value="월" /><font color="#0f705d"><b> 월</b></font> <input
							type="radio" name="day" value="화" /> <font color="#0f705d"><b>화</b></font>
						<input type="radio" name="day" value="수" /> <font color="#0f705d"><b>수</b></font><br>
						<input type="radio" name="day" value="목" /> <font color="#0f705d"><b>목</b></font>
						<input type="radio" name="day" value="금" /> <font color="#0f705d"><b>금</b></font>
						<input type="radio" name="day" value="토" /><font color="#0f705d"><b>
								토</b></font> <input type="radio" name="day" value="일" /><font
							color="#0f705d"><b> 일 </b></font><br> <br> <input
							id="group_search" class="btn btn-info" type="submit"
							value="모임 찾아보기">
					</form>
					<form action="searchGroupName.do" method="get">
						<br>
						<br>
						<b>모임명</b> <input name="group_name" type="text" class="ui"
							size=16px><br> <br> <input id="group_search"
							class="btn btn-info" type="submit" value="모임명으로 검색하기">
					</form>
					<br> <br>
				</div>
				<Br> <Br>
				<button id="group_create" class="btn btn-primary "
					onclick="javascript:location.href='view06_d.jsp';">모임 생성하기</button>
			</div>


			<div class="col-md-9">
				<div class="row carousel-holder">

					<div class="col-md-12">
						<br>
						<table align="center">
							<caption>
								<b><h3>${user_id}회원님을 위한 추천모임</h3></b>
							</caption>
							<tr>
								<td>
									<ul align="center" style="list-style: none">
										<li><a href="groupSearch.do?group_id=${group0.group_id}"><img
												src="${image0}" width="200" height="200" alt=""></a></li>
										<li><b>${group0.group_name}</b></li>
										<li>${group0.interest}</li>
										<li>${group0.state}</li>

									</ul>
								</td>
								<td>
									<ul align="center" style="list-style: none">
										<li><a href="groupSearch.do?group_id=${group1.group_id}"><img
												src="${image1}" width="200" height="200" alt=""></a></li>
										<li><b>${group1.group_name}</b></li>
										<li>${group1.interest}</li>
										<li>${group1.state}</li>

									</ul>
								</td>
								<td>
									<ul align="center" style="list-style: none">
										<li><a href="groupSearch.do?group_id=${group2.group_id}"><img
												src="${image2}" width="200" height="200" alt=""></a></li>
										<li><b>${group2.group_name}</b></li>
										<li>${group2.interest}</li>
										<li>${group2.state}</li>

									</ul>
								</td>
							</tr>
						</table>
						<br>
						<hr>
						<table align="center">
							<caption>
								<b><h3>금주의 인기모임</h3></b>
							</caption>
							<tr>
								<td>
									<ul align="center" style="list-style: none">
										<li><a
											href="groupSearch.do?group_id=${weeklyGroup0.group_id}"><img
												src="${weekimage0}" width="200" height="200" alt=""></a></li>
										<li><b>${weeklyGroup0.group_name}</b></li>
										<li>${weeklyGroup0.interest}</li>
										<li>${weeklyGroup0.state}</li>

									</ul>
								</td>
								<td>
									<ul align="center" style="list-style: none">
										<li><a
											href="groupSearch.do?group_id=${weeklyGroup1.group_id}"><img
												src="${weekimage1}" width="200" height="200" alt=""></a></li>
										<li><b>${weeklyGroup1.group_name}</b></li>
										<li>${weeklyGroup1.interest}</li>
										<li>${weeklyGroup1.state}</li>

									</ul>
								</td>
								<td>
									<ul align="center" style="list-style: none">
										<li><a
											href="groupSearch.do?group_id=${weeklyGroup2.group_id}"><img
												src="${weekimage2}" width="200" height="200" alt=""></a></li>
										<li><b>${weeklyGroup2.group_name}</b></li>
										<li>${weeklyGroup2.interest}</li>
										<li>${weeklyGroup2.state}</li>
									</ul>
								</td>
							</tr>
						</table>
						<br>
						<hr>
						<table align="center">
							<caption>
								<b><h3>최근에 생성된 모임</h3></b>
							</caption>
							<tr>
								<td>
									<ul align="center" style="list-style: none">
										<li><a
											href="groupSearch.do?group_id=${recentGroup0.group_id}"><img
												src="${recentimage0}" width="200" height="200" alt=""></a></li>
										<li><b>${recentGroup0.group_name}</b></li>
										<li>${recentGroup0.interest}</li>
										<li>${recentGroup0.state}</li>
									</ul>
								</td>
								<td>
									<ul align="center" style="list-style: none">
										<li><a
											href="groupSearch.do?group_id=${recentGroup1.group_id}"><img
												src="${recentimage1}" width="200" height="200" alt=""></a></li>
										<li><b>${recentGroup1.group_name}</b></li>
										<li>${recentGroup1.interest}</li>
										<li>${recentGroup1.state}</li>
									</ul>
								</td>
								<td>
									<ul align="center" style="list-style: none">
										<li><a
											href="groupSearch.do?group_id=${recentGroup2.group_id}"><img
												src="${recentimage2}" width="200" height="200" alt=""></a></li>
										<li><b>${recentGroup2.group_name}</b></li>
										<li>${recentGroup2.interest}</li>
										<li>${recentGroup2.state}</li>
									</ul>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>