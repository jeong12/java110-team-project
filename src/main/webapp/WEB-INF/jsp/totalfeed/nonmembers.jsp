<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>전체 피드 보기</title>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function(e) {
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#", "");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
	});

	$(window).on('load', function() {
		load('.js-load', '12');
		$("#js-btn-wrap .more-button").on("click", function() {
			load('.js-load', '12', '#js-btn-wrap');
		})
	});

	function load(id, cnt, btn) {
		var girls_list = id + ":not(.active)";
		var girls_length = $(girls_list).length;
		var girls_total_cnt;
		if (cnt < girls_length) {
			girls_total_cnt = cnt;
		} else {
			girls_total_cnt = girls_length;
			$('.more-button').hide()
		}
		$(girls_list + ":lt(" + girls_total_cnt + ")").addClass("active");
	}
</script>
<style>
.teamPhotoImg {
	width: 250px;
	height: 250px;
	margin: 5px;
}

#titl {
	margin: 10px;
	padding: 10px;
}

#logo {
	width: 50px;
	height: 50px;
	margin: 10px;
}

h2 {
	margin-top: -50px;
	margin-left: 70px;
}

body {
	margin-top: 20px;
}

#td3 {
	text-align: right;
	vertical-align: bottom;
}

ul li {
	list-style-type: none;
	line-height: 30px;
	width: 80%;
}

.td2 {
	width: 700px;
}

.js-load {
	display: none;
	margin: 30px;
}

.js-load.active {
	display: block;
}

.js-load:after {
	display: none;
}

.btn-wrap, .lists {
	display: block;
}

.btn-wrap {
	text-align: center;
}
</style>
</head>
<body>
	<div id="titl">
		<img id="logo" src="../../img/playButton.PNG" alt="플레이로고">
		<h2>전체 피드 보기</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-xs-8 col-xs-offset-2">
				<!-- <form method="get" class="form-inline"> -->
				<div class="input-group">
					<div class="input-group-btn search-panel">
						<select id="selectsearch" class="btn btn-default dropdown-toggle">
							<option value="city">도시</option>
							<option value="teamname" selected="selected">팀명</option>
							<option value="genre">장르</option>
						</select>
					</div>
					<input type="text" class="form-control" name="city"
						placeholder="시,도,군" onkeydown="pushenter()"> <span
						class="input-group-btn">
						<button class="btn btn-default" id="selectsearchbtn"
							onclick="PageMove()">
							<span class="glyphicon glyphicon-search"></span>
						</button> <input type="hidden" name="searchType"
						value="<%=request.getParameter("searchType") != null ? request.getParameter("searchType") : ""%>" />
						<input type="hidden" name="keyword"
						value="<%=request.getParameter("keyword") != null ? request.getParameter("keyword") : ""%>" />
						<!-- <button class="btn btn-default" id="selectsearchbtn" onclick="button1_click();"><span class="glyphicon glyphicon-search"></span></button> -->
					</span>

				</div>

				<!-- </form>  -->
			</div>
			<!-- 인기순 최신순 -->
			<div>
				<div>
					<input type="radio" class="likedate" id="lcnt" name="sortType"
						value="lcnt"
						<%=request.getParameter("sortType") != null
					? request.getParameter("sortType").equals("lcnt") ? "checked" : ""
					: "checked"%>>
					<label for="lcnt">인기순</label>
				</div>

				<div>
					<input type="radio" class="likedate" id="cdt" name="sortType"
						value="cdt"
						<%=request.getParameter("sortType") != null
					? request.getParameter("sortType").equals("cdt") ? "checked" : ""
					: ""%>>
					<label for="cdt">최신순</label>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main">
					<div class="table table-list-search">

						<c:forEach items="${totalFeed}" var="tf">
							<div
								class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
								<button class="js-load">
									<table>
										<tr>
											<td><img src="../../img/${tf.teamPhoto}.png"
												class="teamPhotoImg"></td>
										</tr>
										<tr>
											<td>${tf.teamname}</td>
										</tr>
									</table>
								</button>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main">
					<div class="table table-list-search">
						<c:forEach items="${city}" var="tf">
							<div
								class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
								<button class="js-load">
									<table>
										<tr>
											<td><img src="../../img/${tf.teamPhoto}.png"
												class="teamPhotoImg"></td>
										</tr>
										<tr>
											<td>${tf.teamname}</td>
										</tr>
									</table>
								</button>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="main">
					<div class="table table-list-search">
						<c:forEach items="${teamname}" var="tf">
							<div
								class="gallery_product col-lg-3 col-md-4 col-sm-4 col-xs-6 filter ${tf.teamgenre}">
								<button class="js-load">
									<table>
										<tr>
											<td><img src="../../img/${tf.teamPhoto}.png"
												class="teamPhotoImg"></td>
										</tr>
										<tr>
											<td>${tf.teamname}</td>
										</tr>
									</table>
								</button>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="js-btn-wrap" class="btn-wrap">
		<a href="javascript:;" class="more-button">더보기</a>
	</div>


	<script>
		// document.getElementById("selectsearchbtn").onclick = function() {PageMove()};
		/* 
		 function likedate(){
		 var likedate = $(".likedate option:selected").val();
		 console.log(likedate);
		 }
		 */
		$(function() {
			$("input[name='sortType']").click(
					function() {
						var keyword = $("input[name='keyword']").val();
						var url = '/app/totalfeed/nonmembers';
						var sortType = $(this).val();

						if (keyword != null && keyword != '') {
							var searchType = $("input[name='searchType']")
									.val();

							url += '?searchType=' + searchType + '&keyword='
									+ keyword + '&sortType=' + sortType;
						} else {
							url += '?sortType=' + sortType;
						}

						location.href = url;
					});
		});

		function PageMove() {
			var searchType = $("#selectsearch option:selected").val();
			var keyword = $("input[name='city']").val();
			var sortType = $("input[name='sortType']:checked").val();
			
			location.href = '/app/totalfeed/nonmembers?searchType='
					+ searchType + '&keyword=' + keyword + '&sortType=' + sortType;
		}

		function pushenter() {
			if (window.event.keyCode == 13) {
				PageMove();
			}
		}
	</script>
</body>

</html>
