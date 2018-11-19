<%@ page
    language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Indiesker</title>

<link
    href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
    rel="stylesheet"
    id="bootstrap-css"
>
<script
    src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
></script>
<script
    src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
></script>

<style>
img {
    height: 400px;
}

.carousel-indicators li {
    width: 15px !important;
    height: 15px !important;
    border-radius: 15px;
}

#scheduleform {
    margin-top: 10px;
    margin-bottom: 10px;
}

table {
    text-align: center;
}
</style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>

    <div
        id="carouselExampleIndicators"
        class="carousel slide"
        data-ride="carousel"
    >
        <ol class="carousel-indicators">
            <li
                data-target="#carouselExampleIndicators"
                data-slide-to="0"
                class="active"
            ></li>
            <li
                data-target="#carouselExampleIndicators"
                data-slide-to="1"
            ></li>
            <li
                data-target="#carouselExampleIndicators"
                data-slide-to="2"
            ></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img
                    class="d-block w-100"
                    src="../img/main_test1.JPG"
                    alt="첫번째 슬라이드"
                >
            </div>
            <div class="carousel-item">
                <img
                    class="d-block w-100"
                    src="../img/main_test2.JPG"
                    alt="두번째 슬라이드"
                >
            </div>
            <div class="carousel-item">
                <img
                    class="d-inline-block w-100"
                    src="../img/main_test3.JPG"
                    alt="세번째 슬라이드"
                >
            </div>
        </div>
        <a
            class="carousel-control-prev"
            href="#carouselExampleIndicators"
            role="button"
            data-slide="prev"
        > <span
            class="carousel-control-prev-icon"
            aria-hidden="true"
        ></span> <span class="sr-only">이전</span>
        </a> <a
            class="carousel-control-next"
            href="#carouselExampleIndicators"
            role="button"
            data-slide="next"
        > <span
            class="carousel-control-next-icon"
            aria-hidden="true"
        ></span> <span class="sr-only">다음</span>
        </a>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-5 col-md-4">
                <form
                    method="post"
                    class="form-inline"
                    id="scheduleform"
                >
                    <div class="input-group">
                        <input
                            class="form-control"
                            type="text"
                            name="test"
                            size="100"
                        />
                        <button
                            type="submit"
                            class="btn btn-outline-success "
                        >Search</button>
                    </div>
                </form>
                <br>
                <h4 style="text-align: center;">오늘의 공연 10.11Fri(서울)</h4>
                <div class="table-responsive">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">팀명</th>
                                <th scope="col">장르</th>
                                <th scope="col">지역</th>
                                <th scope="col">시간</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th scope="row">Smooth</th>
                                <td>발라드</td>
                                <td>강남</td>
                                <td>17:00~</td>
                            </tr>
                            <tr>
                                <th scope="row">Smooth</th>
                                <td>발라드</td>
                                <td>강남</td>
                                <td>17:00~</td>
                            </tr>
                            <tr>
                                <th scope="row">Smooth</th>
                                <td>발라드</td>
                                <td>강남</td>
                                <td>17:00~</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 mb-3">
                            <ul class="nav justify-content-center">
                                <li class="page-item"><a
                                    class="page-link"
                                    href="#"
                                    aria-label="Previous"
                                > <span aria-hidden="true">«</span> <span
                                        class="sr-only"
                                    >Previous</span>
                                </a></li>
                                <li class="page-item"><a
                                    class="page-link"
                                    href="#"
                                >1</a></li>
                                <li class="page-item"><a
                                    class="page-link"
                                    href="#"
                                >2</a></li>
                                <li class="page-item"><a
                                    class="page-link"
                                    href="#"
                                >3</a></li>
                                <li class="page-item"><a
                                    class="page-link"
                                    href="#"
                                    aria-label="Next"
                                > <span aria-hidden="true">»</span> <span
                                        class="sr-only"
                                    >Next</span>
                                </a></li>
                            </ul>
                   
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>