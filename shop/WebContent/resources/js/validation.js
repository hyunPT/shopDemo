function loginCheck(){
		var form=document.frm;
		var regExpName = /^[가-힣]/;
		
		
		if(form.id.value==""){
			alert("id를 입력하세요");
			from.id.focus();
			return false;
		}
		
		if(form.id.value.length<4 || form.id.value.length>12){
			alert("아이디는 4~12자 이내로 입력 가능합니다.");
			form.id.focus();
			return false;
		}
		
		
		if(form.pw.value==""){
			alert("비밀번호를 입력하세요");
			form.pw.focus();
			return false;
		}
		
		if(form.pw.value.length<4){
			alert("비밀번호는 4자 이상으로 입력 가능합니다.");
			form.pw.focus();
			return false;
		}
		if(form.pw.value.search(form.id.value) >-1){
			alert("비밀번호는 아이디를 포함할 수 없습니다.");
			form.pw.focus();
			return false;
		}
		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(form.pw.value)){
			alert("비밀번호는 \n영문+숫자+특수기호 8자리 이상으로 구성해야 합니다.");
			pw.focus();
			return false;
		}
		
		if(form.pw_check.value==""){
			alert("비밀번호 확인란를 입력하세요");
			form.pw.focus();
			return false;
		}
		if(form.pw.value!=form.pw_check.value){
			alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다.");
			form.pw.focues();
			return false;
		}
		
		if(form.mail.value==""){
			alert("이메일를 입력하세요");
			form.mail.focus();
			return false;
		}
		
		if(form.name.value==""){
			alert("이름를 입력하세요");
			form.name.focus();
			return false;
		}
		
		if(!regExpName.test(form.name.value)){
			alert("이름은 한글만 입력하세요!");
			form.name.select();
			return;
		}
		

		
		
		
		if(form.phone2.value=="" || form.phone3.value==""){
			alert("핸드폰 번호를 입력하세요");
			form.phone2.focus();
			return false;
		}
		
		if(isNaN(form.phone2.value) || isNaN(form.phone3.value)){
			alert("핸드폰 번호는 숫자로만 입력하세요!");
			form.phone2.select();
			return;
		}
		
		if(form.addressName.value==""){
			alert("주소를 입력하세요");
			form.addressName.focus();
			return false;
		}
		form.submit();
	}