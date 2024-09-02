<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>아이스크림 홈런 학습센터</title>
	<link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<!-- wrap -->
<div class="wrap">
	<!-- header -->
	<%@ include file="/WEB-INF/views/user/common/header.jsp"%>
	<!-- header -->
	<!-- container -->
	<div class="container sub_container">
		<!-- 190426 추가 -->
		<!-- 상단 이미지 -->
		<div class="visual_wrap visual_policy">
			<h2>개인정보처리방침</h2>
			<p>다음과 같이 개인정보 처리방침을 수립·공개합니다</p>
		</div>
		<!--// 상단 이미지 -->
		<!-- 컨텐츠 로케이션 영역 -->
		<div class="location_wrap">
			<div class="inner">
				<ul>
					<li class="home"><span>홈</span></li><!-- 190429 a태그 삭제, span태그 추가 -->
					<li><strong>개인정보처리방침</strong></li><!-- 190429 a태그 삭제 -->
				</ul>
			</div>
		</div>
		<!--// 컨텐츠 로케이션 영역 -->
		<!-- // 190426 추가 -->
		<!-- contents-->
		<div class="contents">
			<div class="inner">
				<h3>개인정보처리방침</h3>
				<div class="wrap_policy">
					<p class="exp">
						㈜아이스크림에듀(이하 '회사'라 한다)은 『정보통신망 이용촉진 및 정보보호에 관한 법률』 및 『개인정보보호법』에 따라 이용자의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리지침을 수립․공개합니다.
					</p>
					<h4>1.개인정보의 수집 및 이용목적</h4>
					<p class="desc">
						회사는 다음의 목적을 위하여 최소한의 개인정보를 처리하며, 목적 이외의 용도로는 이용되지 않습니다. 이용 목적이 변경되는 경우에는 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
					</p>
					<!-- 20190529 수정 및 추가 -->
					<table class="table_style">
					    <caption class="blind">목적 내용으로 구성된 개인정보의 수집 및 이용목적 표</caption>
					    <colgroup>
					        <col style="width:38%;">
					        <col style="width:auto;">
					    </colgroup>
					    <thead>
					        <tr>
					            <th>목적</th>
					            <th>내용</th>
					        </tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td>학습센터 개설 문의에 따른 수집 및 이용</td>
					            <td>&nbsp;• 온라인 지원 및 채용 관리</td>
					        </tr>
					        <tr>
					            <td> 1:1 문의 접수에 따른 수집 및 이용</td>
					            <td>&nbsp;• 1:1 문의 접수 및 관리</ul>
					            </td>
							</tr>
							<tr>
								<td>학습 문의 접수에 따른 수집 및 이용</td>
								<td>&nbsp;• 학습 문의 접수 및 관리</ul>
								</td>
							</tr>
					    </tbody>
					</table>
					<!-- // 20190529 수정 및 추가 -->
					<!-- 20190529 수정 -->
					<h4>2.수집하는 개인정보 항목 및 수집방법</h4>
					<p class="desc">
						관리, 서비스 제공 등을 위해 처리하는 개인정보의 항목 및 수집 방법은 다음과 같습니다.
					</p>
					<table class="table_style">
					    <caption class="blind">목적 구분 개인정보 항목 수집방법 으로 구성된 수집하는 개인정보 항목 및 수집방법 표</caption>
					    <colgroup>
					        <col style="width:12.5%;">
					        <col style="width:20%;">
					        <col style="width:25%;">
					        <col style="width:25%;">
					        <col style="width:auto;">
					    </colgroup>
					    <thead>
					        <tr>
					            <th rowspan="2">목적</th>
					            <th rowspan="2">구분</th>
								<th colspan="2">개인정보 항목</th>
								<th rowspan="2">수집방법</th>
					        </tr>
							<tr>
								<th>필수</th>
								<th>선택</th>
							</tr>
					    </thead>
					    <tbody>
					        <tr>
					            <td>학습센터 개설</td>
								<td>개설 관리</td>
								<td>이름, 전화번호, 생년월일, 결혼여부</td>
								<td>이메일, 거주지역, 근무희망지역</td>
								<td>홈페이지</td>
					        </tr>
					        <tr>
					            <td>1:1 문의</td>
								<td>문의 관리</td>
								<td>이름, 전화번호, 이메일</td>
								<td>-</td>
								<td>홈페이지</td>
					        </tr>
					        <tr>
					            <td>학습 문의</td>
								<td>문의 관리</td>
								<td>이름, 전화번호, 이메일</td>
								<td>-</td>
								<td>홈페이지</td>
					        </tr>
					    </tbody>
					</table>
					<!-- // 20190529 수정 -->
					<h4>3.개인정보의 보유 및 이용 기간</h4>
					<p class="desc">
						개인정보의 수집 및 이용목적 달성, 고객의 개인정보 수집 및 이용 동의 철회 시 수집된 개인정보는 열람하거나 이용할 수 없도록 지체 없이 파기합니다.
					</p>
					<h4>4. 개인정보의 파기절차 및 방법</h4>
					<p class="desc">
						회사는 개인정보 파기 시 재생이 불가능하도록 안전하게 파기하고 있습니다. 타 관련 법령에 의해 개인정보를 계속 보존하여야 하는 경우에는 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존하며, 보존목적 이외의 다른 목적으로 이용되지 않습니다.
					</p>
					<h5>(1) 파기절차</h5>
					<p class="desc">
						- 회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
					</p>
					<h5>(2) 파기방법</h5>
					<p class="desc">
						- 회사는 전자적 파일 형태로 기록․저장된 개인정보는 기록을 재생할 수 없도록 기술적 방법을 이용하여 파기하며, 종이 문서에 기록․저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.
					</p>
					<h4>5. 개인정보의 제3자 제공</h4>
					<p class="desc">
						회사는 이용자의 동의를 받거나 다른 법률에 특별한 규정이 있는 경우에만 개인정보를 제3자에게 제공합니다. 개인정보의 제3자 제공 처리 시는 이용자에게 법률 사항을 사전에 명시적으로 고지하고 고객의 동의를 받습니다.
					</p>
					<h4>6. 이용자 및 법정 대리인의 권리•의무 및 그 행사방법</h4>
					<p class="desc">
						이용자 및 이용자의 법정대리인은 회사에 대해 언제든지 개인정보 열람요구, 오류 등이 있을 경우 정정 요구, 삭제요구, 처리정지 요구의 개인정보 보호 관련 권리를 행사할 수 있으며, 홈페이지, 서면, 전화, 전자우편, 모사전송(FAX) 등을 통하여 회사에 요구하시면 회사는 이에 대해 지체없이 조치하겠습니다.
					</p>
					<p class="desc">
						이용자가 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 회사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.
					</p>
					<p class="desc">
						이용자는 개인정보보호를 위한 관계법령을 위반하여 회사가 처리하고 있는 이용자 본인이나 타인의 개인정보 및 사생활을 침해하여서는 아니됩니다.
					</p>
					<h4>7. 개인정보 자동수집 장치의 설치/운영 및 그 거부에 관한 사항</h4>
					<p class="desc">
						회사는 이용자들에게 보다 적합하고 유용한 서비스를 제공하기 위하여 이용자의 정보를 수시로 저장하고 불러오는 '쿠키(Cookie)를 사용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 이용자의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 이용자의 컴퓨터 하드디스크에 저장됩니다. 이용자는 쿠키 설치에 대한 선택권을 가지고 있으므로, 사용여부를 선택할 수 있습니다.
					</p>
					<p class="desc">
						☞ 쿠키 설정 거부 방법(예: 인터넷 익스플로러의 경우)<br>
						“웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보 탭 > 개인정보처리 수준”에서 설정 이용자가 사용하시는 웹 브라우저의 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.
					</p>
					<h4>8. 개인정보의 기술적∙관리적 보호조치</h4>
					<p class="desc">
						회사는 개인정보의 안전성 확보를 위해 다음과 같은 기술적∙관리적∙물리적 보호조치를 취하고 있습니다.
					</p>
					<p class="desc">
						(1) 관리적 조치 : 내부관리계획 수립․시행, 정기적 직원 교육 등
					</p>
					<p class="desc">
						(2) 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치 등
					</p>
					<p class="desc">
						(3) 물리적 조치 : 전산실, 자료보관실 등의 접근통제 등
					</p>
					<h4>9. 개인정보 보호책임자</h4>
					<p class="desc">
						회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자 및 담당자를 지정하고 있습니다.
					</p>
					<p class="desc">
						회사의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.
					</p>
					<table>
						<colgroup>
							<col style="width:50%;">
							<col style="width:auto">
						</colgroup>
						<tbody>
							<tr>
								<td>
									<h5>개인정보 책임자</h5>
									<p class="desc">
										- 부 서 : 기업부설연구소<br>
										- 성명 및 직위 : 김선회 상무<br>
										- 연락처 : 1544-0910<br>
										- 이메일 : <a href="mailto:homelearn_privacy@sigongeducation.co.kr">homelearn_privacy@sigongeducation.co.kr</a>
									</p>
								</td>
								<td>
									<h5>개인정보 담당자</h5>
									<p class="desc">
										- 부 서 : 서비스개발팀<br>
										- 성명 및 직위 : 김정우 차장<br>
										- 연락처 : 1544-0910<br>
										- 이메일 : <a href="mailto:homelearn_privacy@sigongeducation.co.kr">homelearn_privacy@sigongeducation.co.kr</a>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
					<p class="desc">
						기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br>
						- 개인정보 침해신고센터 : (국번없이)118 (<a href="http://privacy.kisa.or.kr">http://privacy.kisa.or.kr</a>)<br>
						- 개인정보분쟁조정위원회 : 1833-6972 (<a href="http://www.kopico.go.kr">http://www.kopico.go.kr</a>)<br>
						- 대검찰청 사이버수사과 : (국번없이)1301 (<a href="http://www.spo.go.kr">http://www.spo.go.kr</a>)<br>
						- 경찰청 사이버안전국 : (국번없이)182 (<a href="http://cyber.go.kr">http://cyber.go.kr</a>)
					</p>
					<h4>10. 고지의 의무</h4>
					<p class="desc">
						본 개인정보 처리방침에 대한 추가, 삭제 및 수정이 있을 경우에는 시행하는 날로부터 최소 7일전에 공지사항 등을 통해 변경 및 내용 등을 공지하도록 하겠습니다. 다만 이용자의 소중한 권리 또는 의무에 중요한 내용 변경이 발생하는 경우 시행일로부터 최소 30일 전에 공지하도록 하겠습니다.
					</p>
					<p class="desc">
						- 공고일자 : 2019년 04월 01일<br>
						- 시행일자 : 2019년 04월 01일
					</p>
				</div>
			</div>
		</div>
		<!-- // contents-->
	</div>
	<!-- // container -->
	<!-- footer -->
	<%@ include file="/WEB-INF/views/user/common/footer.jsp"%>
	<!-- // footer -->
</div>
<!--// wrap -->
<script src="/resources/js/jquery-1.9.1.min.js"></script>
<script src="/resources/js/default.js"></script>
</body>
</html>
