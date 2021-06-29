<%@page import="com.kh.interactFunding.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="funding_detail" name="title" 	/>
</jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css" />
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script>
	//좋아요 버튼 클릭여부
	window.onload = function(){
	$.ajax({
		url:"${pageContext.request.contextPath}/funding/alramStatusCheck",
		data: {
			memberNo : ${loginMember.memberNo},
		},
		success(data){
			console.log(data)
			/* 좋아요를 누른상황 */
			if(data == 1){
				$("#icon_alram").html('<i class="fas fa-bell"> 알림신청 완료</i>');
			
			}else{
			/* 좋아요 안누른상황 */
				$("#icon_alram").html('<i class="far fa-bell"> <span class="alramClass"> 알림받기 </span></i> ');
			}
		},
		error: console.log
		,
		})
	};

</script>
        <div id="funding_main">
            <div id="funding_main_image_and_content">
                <div id="funding_main_image">
                    <img src="${pageContext.request.contextPath }/resources/upload/${funding.attachment.renamedFilename}" alt="" style="width: 100%; height: 100%;">
                </div>

                <div id="funding_main_content">
                	<div id="earlyfunding_title">${funding.title}</div>
                 	<br />	<br />	<br />	<br />	<br />
                 	<div>${funding.earlyContent}</div>
                </div>
            </div>

            <div id="funing_main_right_div">
                <div id="funing_main_right_div_1">
                    <button type="button" id="funding_detail_alram_button" class="btn btn-outline-secondary" onclick="alram_controll()">
	                    <!--알람 종  -->
	                    <span id="icon_alram" style="color:red;"><i class="far fa-bell"></i></span>
                    </button>
                </div>
                <span id="funding_detail_like_count"></span>

			 	<span id="maker_span">메이커 정보</span>
				<!--메이커정보 (해당 펀딩의 작성자정보) -->
                <div id="funing_main_right_div_2">
                	<div id="funding_detail_maker_logo_name_div">
                		<div id="funding_detail_maker_name">${wirterName}</div>
                	</div>
                		<div id="funding_detail_maker_phone">메이커 연락처 <br/>${funding.phone}</div>
                    <input type="button" value="메이커에게 문의하기" id="funding_detail_maker_chat_button" class="btn btn-info"
                     data-toggle="modal" data-target="#modalSendMsg" data-tomemberno="${funding.writerNo}" onclick="msgSetting(this)"/>
                </div>
            </div>
        </div>
	
    <style>
      
    #funding_top_title_wrapper_wrapper{
    height: 194px;
    overflow: hidden;
    width: 100vw;
    }
     
    
    #funding_top_title_image{
   	width: 100%;
    height: 197px;
    filter: blur(5px);
    transform: scale(1.8);
    
    }
    
    #funding_top_title_div{
    margin-top: -159px;
    text-align: center;
    font-size: 40px;
    font-weight: 900;
    z-index: 999;
    position: relative;
    color: #fff;
    }
    
    #funding_top_p{
    margin-top: -62px;
    text-align: center;
    font-size: 40px;
    font-weight: 900;
    z-index: 999;
    
    }

    #funding_tap > ol {
    height: 50px;
    border-bottom: 3px solid #c0c2c0;
    text-align: center;
    }

    #funding_tap > ol > li{
    display: inline-block; 
    width: 98px;
    padding: 3px 10px;
    font-weight: 800;
    }

    /* 펀딩 메인 전체 div */
    #funding_main{
    width: 1000px;
    display: flex;
    margin: auto;
    }


    #funding_main_image_and_content{
    width: 800px;
    overflow: hidden;
    }

    /* 펀딩 메인 이미지 */
    #funding_main_image{
    height: 500px;
    width: 95%;
    }

    /* 펀딩 메인 내용 */
    #funding_main_content{
    width: 97%;
    height: 2000px;
    }

    /* 펀딩 메인 오른쪽 펀딩하기 div*/
    #funing_main_right_div{
    font-size: 20px;
    font-weight: 600;
    }
    #funing_main_right_div_2, #funing_main_right_div_3, #funing_main_right_div_4{
	border: 2px solid #cccccc;
    border-radius: 6px;
    }
    
    /* 펀딩 메인 오른쪽 펀딩하기 div1 > div*/
    #funing_main_right_div_1 > div{
    height: 41px;
    margin-top: 6px;
    }


	
	#funing_main_right_div_2 {
    height: 229px !important;
	}
	
	
    #funing_main_right_div > div{
    width: 220px;
    padding-left: 10px;
    padding-top: 9px;
    }
    
    #funing_main_right_div_3{
    margin-bottom: 13px;
    cursor: pointer;
    min-height: 300px;
    }
    
    #funing_main_right_div_4{
    min-height: 300px;
    
    }
    /* 펀딩하기버튼 */
    #funding_button {
    width: 96%;
    height: 50px;
    margin-top: 25px;
    }
    
    /* 좋아요 1:1채팅 공유하기 버튼 */
	#funding_detail_alram_button{
	width: 201px;
	}
	
	/* 메이커 로고 + name */
	#funding_detail_maker_logo_name_div {
	display: flex;
	}
	
	#funding_detail_maker_logo_name_div > div {
	/* border: 2px solid black; */
	}

	#funding_detail_dday_bar_wrapper{
	height: 2px;
	}
	
	#funding_detail_dday_div{
	font-size: 24px;
	font-weight: 700;
	}
	
	#funding_detail_dday_bar{
	height: 10px;
	margin-top: 14px;
	}
	
	#funding_detail_maker_chat_button{
	margin-top: 13px;
    width: 96%;
    height: 50px;
	}
	
	#funding_detail_maker_name{
	margin-bottom: 11px;
	font-size : 25px;
	}
	
	#maker_span, #reward_span, #ranking_span{
	font-size: 9px;
    color: gray;
	}
	
	.category_code_span{
	font-size: 21px;
	}
	
	#fundingReward_title{
	font-size: 17px;
	padding-bottom: 9px;
	
	}
	#fundingReward_content{
	color: #929292;
    font-size: 14px;
    padding-bottom: 9px;
	}
	#fundingReward_shipping_title{
    color: #929292;
    font-size: 14px;
	}
	#fundingReward_shippint_price{
    font-size: 17px;
    padding-bottom: 9px;
	}
	
	#fundingReward_shipping_date_title{
    color: #929292;
    font-size: 14px;
	}
	#fundingReward_shipping_date_number{
	font-size: 15px;
	padding-bottom: 9px;	
	}
	#fundingReward_limit{
    color: #00a2a2;
    font-size: 14px;
    background-color: #E7F9F9;
    display: inline;
	}
	#fundingReward_reward_ing{
    font-size: 14px;
	}
	#fundingReward_price{
	padding-bottom: 10px;
	
	}
	
	#fundingReward_hoverdiv{
	background-color: pink;
	}
	
	.alramClass{
	font-weight: 900;
	}
	
    </style>
    
	<script>

    //알람신청 누를시
	function alram_controll(){
		$("#funding_detail_alram_button").attr("onclick","");
		
		$.ajax({
			url: "${pageContext.request.contextPath}/funding/loginMemberClickAlram",
			data: {
				memberNo : ${loginMember.memberNo},
				fundingNo : ${funding.fundingNo},
			},
			method: "POST",
			
			
			success(data){
				console.log(data);
				if(data.alram == "on"){
					$("#icon_alram").html('<i class="fas fa-bell"> 알림신청 완료</i>');
					swal("알람받기 신청이 완료되었습니다.", "펀딩이 시작되는 날짜에 쪽지로 알려드릴게요~!", "success");
				}else{
					$("#icon_alram").html('<i class="far fa-bell"> </i> <span class="alramClass"> 알림받기</span>');
					swal("알람받기 신청이 취소되었습니다.", "아쉽지만 다음번에 다시 만나요~!", "success");
				}
			},
			error: console.log
			,
			complete(){
				$("#funding_detail_alram_button").attr("onclick","alram_controll();");
			} 
		})
	};

	</script>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
