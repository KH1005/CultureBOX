package culture.member.login;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.Validate;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import culture.member.evaluation.EvalService;
import culture.member.evaluation.MemberModel;
import culture.member.evaluation.MusicModel;

@Controller
@RequestMapping("/member")
public class MemberController {

   @Resource(name = "memberService")
   private MemberService memberService;

   
   @Resource(name="evalService")
   private EvalService evalService;
   

   ModelAndView mav = new ModelAndView();

   // 로그인 페이지
   @RequestMapping(value = "/loginForm.cul", method = RequestMethod.GET)
   public String loginForm() {
      return "/login/loginForm";
   }


   //메인페이지 리다이렉트
   @RequestMapping(value="/mainPage.cul", method = RequestMethod.GET)
   public ModelAndView mainPage(HttpServletRequest request) {
      HttpSession session = request.getSession();
      String id = (String)session.getAttribute("id");
      MemberModel memberModel = new MemberModel();
      memberModel.setMEMBER_ID(id);
      
      List<MusicModel> musicList = evalService.selectMusicList(memberModel);
      Collections.shuffle(musicList);
      mav.addObject("musicList",musicList);
      mav.setViewName("evalList");
      return mav;
   }

   // 로그인
   @SuppressWarnings("unused")
   @RequestMapping(value = "/login.cul", method = RequestMethod.POST)
   public ModelAndView memberLogin(HttpServletRequest request, MemberModel member) {

      MemberModel result = memberService.logIn(member);
  
      
      
      
     if (result == null) {
    	 System.out.println(result);
    	 mav.setViewName("login/loginError");
    	 return mav;
      }
      
      if (result.getMEMBER_ID().equals("admin1")) {
         HttpSession session = request.getSession();

         session.setAttribute("member", result);
         session.setAttribute("id", result.getMEMBER_ID());
         session.setAttribute("name", result.getMEMBER_NAME());
         session.setAttribute("password", result.getMEMBER_PASSWORD());
         session.setAttribute("email", result.getMEMBER_EMAIL());
         System.out.println("1111111111111111");

            mav.setViewName("redirect:/admin/MusicListForm.cul");
         return mav;
      

      }

      else if (result != null) {
         HttpSession session = request.getSession();

         session.setAttribute("member", result);
         session.setAttribute("id", result.getMEMBER_ID());
         session.setAttribute("name", result.getMEMBER_NAME());
         session.setAttribute("password", result.getMEMBER_PASSWORD());
         session.setAttribute("email", result.getMEMBER_EMAIL());
         /*
          * if(result != null){ System.out.println("로그인 성공");
          */

         mav.setViewName("memberMain");

         mav.setViewName("redirect:http://localhost:8080/culture/eval/EvalList.cul");

         return mav;
         /* } */
      }

      // 로그인 실패
      mav.setViewName("login/loginError");
      return mav;
   }

   /*
    * String name = request.getParameter("MEMBER_NAME"); String email =
    * request.getParameter("MEMBER_EMAIL");
    * 
    * member.setMEMBER_NAME(name); member.setMEMBER_EMAIL(email);
    * 
    * member = memberService.findId(member);
    * 
    * if(member == null){ memberFindChk = 0;
    * mav.addObject("memberFindChk",memberFindChk);
    * mav.setViewName("/login/idFindError"); return mav; }else{
    * if(member.getMEMBER_NAME().equals(name) &&
    * member.getMEMBER_EMAIL().equals(email)){ memberFindChk = 1;
    * mav.addObject("member",member); mav.addObject("memberFindChk",memberFindChk);
    * mav.setViewName("/login/idFindOK"); return mav; }else{
    */

   // 로그아웃
   @RequestMapping(value = "/logout.cul", method = RequestMethod.GET)
   public String memberLogout(HttpServletRequest request, MemberModel mem) {
      HttpSession session = request.getSession(false);


      if (session != null) {
         System.out.println("로그아웃 성공");

      
      if(session != null){

         session.invalidate();
      }

      //mav.setViewName("member/logout");
      
   }
      return "/login/loginForm";
   }
   // 유효성 검사시 에러발생시 넘어가게 하는 로직
   @ModelAttribute("member")
   public MemberModel formBack() {
      return new MemberModel();
   }

   // 회원가입완료
   @RequestMapping(value = "/signUp.cul", method = RequestMethod.POST)
   public ModelAndView signUp(@ModelAttribute("member") MemberModel member, BindingResult result) {
      // Validate Binding

      try {

         memberService.signUp(member);
         mav.setViewName("/login/loginForm");
         System.out.println("success in");
         return mav;
      } catch (DuplicateKeyException e) {

         result.reject("invalid", null);
         mav.setViewName("memberInfo");
         return mav;
      }
   }

   /* 로그인폼 */
   @RequestMapping(value = "/signUpForm.cul", method = RequestMethod.GET)
   public String signUpForm() {
      return "/login/signUpForm";
   }

   /* id 중복체크 */
   @RequestMapping(value = "/idcheck.cul", produces = "application/json", method = RequestMethod.POST)
   @ResponseBody
   public Map<Object, Object> idcheck(@RequestBody String userid) {
      System.out.println(userid);
      int count = 0;
      Map<Object, Object> map = new HashMap<Object, Object>();

      count = memberService.idcheck(userid);
      map.put("count", count);
      System.out.println(count);
      return map;
   }

   @RequestMapping(value = "/findIdForm.cul", method = RequestMethod.GET)
   public ModelAndView findPwForm() {
      mav.setViewName("/login/idFind");
      return mav;
   }

   @RequestMapping(value = "/findId.cul", method = RequestMethod.POST)
   public ModelAndView findId(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

      int memberFindChk;
      String name = request.getParameter("MEMBER_NAME");
      String email = request.getParameter("MEMBER_EMAIL");

      member.setMEMBER_NAME(name);
      member.setMEMBER_EMAIL(email);

      member = memberService.findId(member);

      if (member == null) {
         memberFindChk = 0;
         mav.addObject("memberFindChk", memberFindChk);
         mav.setViewName("/login/idFindError");
         return mav;
      } else {
         if (member.getMEMBER_NAME().equals(name) && member.getMEMBER_EMAIL().equals(email)) {
            memberFindChk = 1;
            mav.addObject("member", member);
            mav.addObject("memberFindChk", memberFindChk);
            mav.setViewName("/login/idFindOK");
            return mav;
         } else {
            memberFindChk = -1;
            mav.addObject("memberFindChk", memberFindChk);
            mav.setViewName("/login/idFindError");
            return mav;
         }
      }
   }
}

