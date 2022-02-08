package dongduk.dalc05.aah.controller;

import dongduk.dalc05.aah.domain.Member;
import dongduk.dalc05.aah.domain.Sick;
import dongduk.dalc05.aah.service.MemberService;
import dongduk.dalc05.aah.service.SickService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SickService sickService;

	// 완료 // 메인페이지 -> 회원가입페이지 이동
    @RequestMapping(value = "/member/join")
    public ModelAndView join() {
    	
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("member/join");
        
    	List<Sick> list = new ArrayList<>();
    	list = sickService.getSickList();
    	mav.addObject("sicks", list);
    	return mav;
    }
	
	// 회원가입
    /* <개발미완>
    1. 이메일 중복확인
    2. 이메일 인증
    3. 닉네임 중복확인 */
	@RequestMapping(value="/member/join.do")
	public String joinDo(
			HttpServletRequest request,
			Model model,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw,
    		@RequestParam ("member_name") String member_name,
    		@RequestParam ("member_nickName") String member_nickName,
    		@RequestParam ("member_phone") String member_phone,
    		@RequestParam ("member_birth") @DateTimeFormat (pattern ="yyyy-MM-dd") Date member_birth,
    		@RequestParam ("sick_code") int sick_code,
    		@RequestParam (value="member_sex") String member_sex,
    		@RequestParam (value="member_allergy", required = false) String member_allergy ,
    		@RequestParam (value="member_image", required = false) String member_image
			) {
		
		Member member = new Member(member_id, member_pw, member_name, member_nickName, member_phone,
				member_birth, sick_code, member_allergy, member_image, member_sex);
		memberService.insertMember(member);
		
		model.addAttribute("msg", "가입을 축하합니다! 로그인을 해주세요");
        model.addAttribute("url","/member/login");
        return "alert/joinSucess";
	}
	
	// 완료 // 메인페이지 -> 로그인페이지 이동
    @RequestMapping(value = "/member/login")
    public String login() {
		return "member/login";
    }
    
	// 완료 // 로그인 시도
	@RequestMapping(value="/member/login.do")
	public String loginDo(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw) throws IOException {
		
		String saveId = request.getParameter("saveId");
		
		boolean isValidUser = memberService.isValidUser(member_id, member_pw);
		if (isValidUser == true) {
			int member_code = memberService.getMemberCode(member_id);

			// 로그인 세션 처리 
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", memberService.getMemberInfo(member_code));
			
			Member m = (Member) session.getAttribute("loginMember");
			model.addAttribute("msg", m.getMember_nickName() + "님 방문을 환영합니다");
	        model.addAttribute("url","/");
	    
	        if(saveId != null) {
	        	 Cookie c = new Cookie("saveId", member_id);
	             c.setMaxAge(60*60*24*14); // 14일간 저장
	             response.addCookie(c);
	        }
	        else {
	        	Cookie c = new Cookie("saveId", member_id);
	        	c.setMaxAge(0);
	        	response.addCookie(c);
	        }
	        return "alert/loginSucess";
    	}

		// 틀렸을 경우
		model.addAttribute("msg", "아이디와 비밀번호가 올바르지 않습니다.");
        model.addAttribute("url", "/member/login");
        return "alert/alert";
	}
	
	// 완료 // 로그아웃(세션제거)
	@RequestMapping(value = "/member/logout.do")
	public String logoutDo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginMember");
		return "redirect:/main";
	}
	
	// 정보수정(마이페이지)으로 이동
	@RequestMapping(value="/member/mypage")
	public ModelAndView myPage(
			HttpServletRequest request,
			Model model) {
					
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
	
		int code = memberService.getMemberCode(member_id);
		Member me = memberService.getMemberInfo(code);
  
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/myPage");
        mav.addObject("me", me);
		return mav;
	}
	
	// 내정보 업데이트
	@RequestMapping(value="/member/mypage/update.do")
	public String MyPageUpdate(
			HttpServletRequest request,
			Model model,
			@RequestParam ("member_id") String member_id,
    		@RequestParam ("member_pw") String member_pw,
    		@RequestParam ("member_name") String member_name,
    		@RequestParam ("member_nickName") String member_nickName,
    		@RequestParam ("member_phone") String member_phone,
    		@RequestParam ("member_birth") @DateTimeFormat (pattern ="yyyy-MM-dd") Date member_birth,
    		@RequestParam ("sick_code") int sick_code,
    		@RequestParam (value="member_allergy", required = false) String member_allergy ,
    		@RequestParam (value="member_image", required = false) String member_image,
    		@RequestParam (value="member_sex") String member_sex) {
		
//		Member member = new Member(member_id, member_pw, member_name, member_nickName, member_phone,
//				member_birth, sick_code, member_allergy, member_image, member_sex);
//		memberService.insertMember(member);
//		System.out.println("회원가입 성공" + member.toString());
		
		model.addAttribute("msg", "수정하였습니다.");
        model.addAttribute("url","/member/mypage");
    
        return "alert/alert";	
	}
	// 탈퇴
	@RequestMapping(value="/member/delete.do")
	public String deleteDo(
			HttpServletRequest request,
			Model model) {
					
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		
		// DB에서 삭제 
		memberService.deleteMember(memberService.getMemberCode(member_id));
		
		// session.removeAttribute("member_code");
		session.removeAttribute("member_id");
		session.removeAttribute("member_nickName");
		
		model.addAttribute("msg", "탈퇴되었습니다.");
        model.addAttribute("url","/");
  
		return "alert/alert";
	}
	
	
}
