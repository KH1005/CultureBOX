package culture.member.reservation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import culture.member.reservation.reserveService;
import culture.member.culture.CultureService;
import culture.admin.culture.seatModel;
import culture.member.culture.CultureModel;
import culture.member.reservation.reserveModel;

@Controller
public class reserveController  {

   String id;
   int cidx;
   int CULTURE_IDX;
   
   @Resource
   private reserveService rvService;
   @Resource
   private CultureService cService;
   
   @RequestMapping(value="/reserve/reservationForm.cul", method=RequestMethod.GET)
      public ModelAndView reservationForm(HttpServletRequest request, HttpSession session, reserveModel rvBean) {
         ModelAndView mv = new ModelAndView();
         
         CULTURE_IDX = (int)session.getAttribute("cidx");
   
         CultureModel cModel = cService.cultureDetail(CULTURE_IDX);    
         
         mv.addObject(cModel);
         mv.setViewName("reserveForm");
         
         return mv;
      }
   

   @RequestMapping(value="/reserve/seatList.cul")
   public ModelAndView seatList(HttpServletRequest request, HttpSession session, CultureModel cultureModel) {
	   ModelAndView mv = new ModelAndView();
	   
	   List<seatModel> seatList = rvService.selectSeat(cultureModel.getCULTURE_IDX());
	   
	   if(seatList == null) {
		   System.out.println("null");
	   } else {
		   System.out.println("nt null");
	   }
	   mv.addObject("seatList", seatList);
	   mv.setViewName("seatList");
	   
	   return mv;
   }
   
   @RequestMapping(value="/reserve/payForm.cul", method=RequestMethod.GET)
   public ModelAndView payForm(HttpServletRequest request, HttpSession session, reserveModel rvBean) {
      ModelAndView mv = new ModelAndView();
      /*
      if(session.getAttribute(id) == null) {
         mv.setViewName("Login.box");
         
         return mv;
      }
      */
      rvBean.setRESERVE_ID((String)session.getAttribute("id"));
      rvBean.setRESERVE_CIDX((int)session.getAttribute("cidx"));
         
      return mv;
   }
   
   @RequestMapping(value="/reserve/payForm.cul", method=RequestMethod.POST)
   public ModelAndView pay(HttpServletRequest request) {
      ModelAndView mv = new ModelAndView();
      
      mv.setViewName("/reserve/payComplete.cul");
      
      return mv;
   }
   
   @RequestMapping(value="/reserve/payComplete.cul", method=RequestMethod.GET)
   public ModelAndView payComplete(HttpServletRequest request, HttpSession session) {
      ModelAndView mv = new ModelAndView();
      
      /*if(session.getAttribute(id) == null) {
         mv.setViewName("Login.box");
      }
      */
      mv.setViewName("");
      
      return mv;
   }
}