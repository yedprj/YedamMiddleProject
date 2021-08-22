<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 	<!-- Start Top Nav -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
        <div class="container text-light">
            <div class="w-100 d-flex justify-content-between">
                <div>
                    <i class="fa fa-envelope mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="mailto:info@company.com">예담직업전문학교</a>
                    <i class="fa fa-phone mx-2"></i>
                    <a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">053-421-2460</a>
                </div>
            </div>
        </div>
    </nav>
    <!-- Close Top Nav -->
    
    <!-- Header -->
    <div class="navbar navbar-expand-lg navbar-light shadow">
        <div class="container d-flex justify-content-between align-items-center">

            <a class="navbar-brand text-success logo h1 align-self-center" href="home.do">
                Co-By
            </a>
            
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
                <div class="flex-fill">
                    <ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="purchaseList.do">공동구매</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="boardList.do">커뮤니티</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="noticeList.do">공지사항</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="csList.do">고객센터</a>
                        </li>
                    </ul>
                </div>
                
                <div class="navbar align-self-center d-flex">
                    <div class="d-lg-none flex-sm-fill mt-3 mb-4 col-7 col-sm-auto pr-3">
                        <div class="input-group">
                            <input type="text" class="form-control" id="inputMobileSearch" placeholder="Search ...">
                            <div class="input-group-text">
                                <i class="fa fa-fw fa-search"></i>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col text-end">
						<c:if test="${empty user.userId  }">
							<button type="button" class="btn btn-outline-primary me-2"
								onclick="location.href='loginForm.do'">로그인</button>
						</c:if>
						<c:if test="${not empty user.userId  }">
						
							<div class="dropdown">	
								<a href="#" class="nav-link px-3 link-dark fs-5 dropdown" id="userDropdown"
				                 data-bs-toggle="dropdown" aria-expanded="false">
				                	 <span>${user.userNickname }</span>
				                 	 <img class="" src="">
				                 </a>
								
								<div class="dropdown-menu" aria-labelledby="userDropdown">
									<c:if test="${user.userAuthor eq 'ADMIN'}">
										<a class="dropdown-item" href="adminAccount.do">관리자</a>
									</c:if>
									<a class="dropdown-item" href="myPage.do">마이페이지</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="logout.do">로그아웃</a>
								</div>
							</div>
						</c:if>
					</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Close Header -->