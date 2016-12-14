<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- HERO BLOCK
    ============================== -->
<div class="hero hero__bs">
	<div class="hero__inner">
		<div class="wrapper">
			<div class="wrapper__inner">
				<div class="container">
					<div class="row" id="hero__content">
						<div class="col-sm-12 text-center">
							<h1 class="hero__h1">혼자서도 잘해요</h1>
							<!-- 		<h2 class="hero__h2">하상현 진짜 개멍청해</h2>
							<p class="hero__intro">부트스트랩 사용</p> -->
						</div>
					</div>
					<!-- / .row -->
				</div>
				<!-- / .container -->
			</div>
			<!-- / .wrapper__inner -->
		</div>
		<!-- / .wrapper -->
	</div>
	<!-- / .hero__inner -->

	<!-- Backstretch controls -->
	<div class="hero__ctrl js-hero-bs__ctrl">
		<a href="#hero__carousel" role="button" data-slide="prev"> <i
			class="fa fa-step-backward"></i>
		</a> <a href="#" data-slide="pause" class="visible-inline-block playback">
			<i class="fa fa-pause"></i>
		</a> <a href="#" data-slide="resume" class="playback hidden"> <i
			class="fa fa-play"></i>
		</a> <a href="#hero__carousel" role="button" data-slide="next"> <i
			class="fa fa-step-forward"></i>
		</a>
	</div>
	<!-- / .hero__ctrl -->
</div>
<!-- / .hero -->


<!-- PORTFOLIO
    ============================== -->
<div class="section section_portfolio section_alt">
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<h1 class="section__title">회원들이 추천한 가게</h1>
				<p class="section__intro">인기있는 가게입니다.</p>
				<div class="section__hr section__hr_center"></div>
			</div>
		</div>
		<!-- / .row -->

		<div class="row">
			<div class="col-xs-12">
				<!-- Portfolio Carousel -->
				<div id="portfolio__carousel" class="carousel slide"
					data-ride="carousel">

					<!-- Controls -->
					<div class="portfolio-carousel__controls">
						<a href="#portfolio__carousel" role="button" data-slide="prev">
							<i class="fa fa-long-arrow-left"></i>
						</a> <a href="#portfolio__carousel" role="button" data-slide="next">
							<i class="fa fa-long-arrow-right"></i>
						</a>
					</div>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">

						<!-- Slide #1 -->
						<div class="item active">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #1 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img src="resources/img/혼자가기 좋은 음식 쌀국수.PNG"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">홍대 칼국수집</h3>
											<!-- 	<div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #2 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/resources/img/혼자 먹기 좋은 순대국.PNG"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">강남 순대국</h3>
											<!-- 	<div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #3 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/resources/img/혼자가기 좋은 일본 음식점.PNG"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">종로 일본 라면</h3>
											<!-- <div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #4 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/resources/img/판교볶음밥.jpg"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">판교 볶음밥</h3>
											<!-- <div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
							</div>
							<!-- / .row -->
						</div>
						<!-- / .item -->

						<!-- Slide #2 -->
						<div class="item">
							<div class="row">
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #1 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img src="resources/img/새싹비빔밥.jpg"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">종로 새싹비빔밥</h3>
											<!-- 		<div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #2 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img src="resources/img/잠식맥앤치즈.jpg"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">잠실 맥 앤 치즈</h3>
											<!-- <div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #3 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/resources/img/잠실스테이크.jpg"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">잠실 스테이크</h3>
											<!-- 	<div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
								<div class="col-xs-6 col-sm-6 col-md-3">
									<!-- Portfolio Item #4 -->
									<div class="portfolio__item">
										<!-- Image -->
										<div class="portfolio__img">
											<a href="#"> <img
												src="${pageContext.request.contextPath}/resources/img/부산 크림파스타.jpg"
												alt="Portfolio Image">
											</a>
										</div>
										<!-- Captions -->
										<div class="portfolio__caption">
											<h3 class="portfolio__title">부산 크림 파스타</h3>
											<!-- <div class="portfolio__intro">Morbi vulputate eget
												ipsum vel maximus. Morbi dictum blandit mattis.</div> -->
										</div>
									</div>
								</div>
							</div>
							<!-- / .row -->
						</div>
						<!-- / .item -->

					</div>
					<!-- / .carousel-inner -->
				</div>
				<!-- / .carousel -->
			</div>
		</div>
		<!-- / .row -->
	</div>
	<!-- / .container -->
</div>
<!-- / .section -->

<!-- AUTHORS
    ============================== -->
    <div class="section section_authors">
      <div class="container">
        <div class="row">
          <div class="col-xs-12">
            <h1 class="section__title">
              Our Contributors
            </h1>
            <p class="section__intro">
              A team of hard-working enthusiastic people who helped this product come to life
            </p>
            <div class="section__hr section__hr_center"></div>
          </div>
        </div> <!-- / .row -->
        <div class="row">
          <!-- Author #1 -->
          <div class="col-xs-12 col-sm-4">
            <div class="authors__item">
              <div class="authors__img wow flipInY" data-wow-offset>
                <img src="${pageContext.request.contextPath}/resources/img/photo_1.jpg" class="img-responsive" alt="...">
              </div>
              <div class="authors__content">
                <div class="authors__title">John Doe, Designer</div>
                <div class="authors__intro">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu lacus enim. Aliquam eu elit justo. 
                </div>
                <ul class="authors__contact">
                  <li class="facebook">
                    <a href=""><i class="fa fa-facebook"></i></a>
                  </li>
                  <li class="twitter">
                    <a href=""><i class="fa fa-twitter"></i></a>
                  </li>
                  <li class="linkedin">
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </li>
                  <li class="envelope">
                    <a href=""><i class="fa fa-envelope-o"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!-- Author #2 -->
          <div class="col-xs-12 col-sm-4">
            <div class="authors__item">
              <div class="authors__img wow flipInY" data-wow-delay=".2s">
                <img src="${pageContext.request.contextPath}/resources/img/photo_2.jpg" class="img-responsive" alt="...">
              </div>
              <div class="authors__content">
                <div class="authors__title">Judy Roe, Designer</div>
                <div class="authors__intro">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu lacus enim. Aliquam eu elit justo. 
                </div>
                <ul class="authors__contact">
                  <li class="facebook">
                    <a href=""><i class="fa fa-facebook"></i></a>
                  </li>
                  <li class="twitter">
                    <a href=""><i class="fa fa-twitter"></i></a>
                  </li>
                  <li class="linkedin">
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </li>
                  <li class="envelope">
                    <a href=""><i class="fa fa-envelope-o"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!-- Author #3 -->
          <div class="col-xs-12 col-sm-4">
            <div class="authors__item">
              <div class="authors__img wow flipInY" data-wow-delay=".4s">
                <img src="${pageContext.request.contextPath}/resources/img/photo_3.jpg" class="img-responsive" alt="...">
              </div>
              <div class="authors__content">
                <div class="authors__title">Richard Doe, Developer</div>
                <div class="authors__intro">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu lacus enim. Aliquam eu elit justo. 
                </div>
                <ul class="authors__contact">
                  <li class="facebook">
                    <a href=""><i class="fa fa-facebook"></i></a>
                  </li>
                  <li class="twitter">
                    <a href=""><i class="fa fa-twitter"></i></a>
                  </li>
                  <li class="linkedin">
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </li>
                  <li class="envelope">
                    <a href=""><i class="fa fa-envelope-o"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div> <!-- / .row -->
        <!-- Author #3 -->
        <div class="row" align="center">
          <div class="col-xs-12 col-sm-4">
            <div class="authors__item">
              <div class="authors__img wow flipInY" data-wow-delay=".4s">
                <img src="${pageContext.request.contextPath}/resources/img/photo_3.jpg" class="img-responsive" alt="...">
              </div>
              <div class="authors__content">
                <div class="authors__title">Richard Doe, Developer</div>
                <div class="authors__intro">
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu lacus enim. Aliquam eu elit justo. 
                </div>
                <ul class="authors__contact">
                  <li class="facebook">
                    <a href=""><i class="fa fa-facebook"></i></a>
                  </li>
                  <li class="twitter">
                    <a href=""><i class="fa fa-twitter"></i></a>
                  </li>
                  <li class="linkedin">
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </li>
                  <li class="envelope">
                    <a href=""><i class="fa fa-envelope-o"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <!-- Author #3 -->
          <div class="col-xs-12 col-sm-4">
            <div class="authors__item">
              <div class="authors__img wow flipInY" data-wow-delay=".4s">
                <img src="${pageContext.request.contextPath}/resources/img/HaSang.jpg" class="img-responsive" alt="...">
              </div>
              <div class="authors__content">
                <div class="authors__title">SangHyeon Ha, Developer</div>
                <div class="authors__intro">
                  LOL. 
                </div>
                <ul class="authors__contact">
                  <li class="facebook">
                    <a href=""><i class="fa fa-facebook"></i></a>
                  </li>
                  <li class="twitter">
                    <a href=""><i class="fa fa-twitter"></i></a>
                  </li>
                  <li class="linkedin">
                    <a href=""><i class="fa fa-linkedin"></i></a>
                  </li>
                  <li class="envelope">
                    <a href=""><i class="fa fa-envelope-o"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div> <!-- / .row -->
      </div> <!-- /.container -->
    </div> <!-- / .section -->
    


