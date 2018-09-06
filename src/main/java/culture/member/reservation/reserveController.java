package culture.member.reservation;

import java.util.ArrayList;

import java.util.List;

import java.util.Date;
import java.util.HashMap;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
   
 
   @RequestMapping(value="/reserve/reservationForm.cul")
      public ModelAndView reservationForm(HttpServletRequest request, HttpSession session, CultureModel ctModel, seatModel stModel) {
         ModelAndView mv = new ModelAndView();
         
         int CULTURE_IDX = (Integer.parseInt(request.getParameter("culture_idx")));
     	 
         if(request.getParameter("culture_idx") != null) {
        	 session.setAttribute("cidx", CULTURE_IDX);
         } else {
          CULTURE_IDX = (int)session.getAttribute("cidx");
         }
         /*String id = (String)session.getAttribute("id");*/
         
         stModel.setSEAT_CIDX(CULTURE_IDX);
         stModel.setSEAT_DATE(request.getParameter("seat_date"));
         ctModel.setCULTURE_IDX(CULTURE_IDX);
         session.setAttribute("id", id);
         
  	     List priceList = new ArrayList();
         CultureModel ctDetail = cService.cultureDetail(CULTURE_IDX); 
    
         String sDay = ctDetail.getCULTURE_START();
         String eDay = ctDetail.getCULTURE_END();
         String startDay[] = sDay.split(" ");
         String endDay[] = eDay.split(" ");
         
         String area[] = ctDetail.getCULTURE_AREA().split(",");
         String price[] = ctDetail.getCULTURE_PRICE().split(",");
         
         for(int i = 0; i < area.length; i++) {
       	 priceList.add(area[i].concat(" : ").concat(price[i]));
         }
         
         if(stModel.getSEAT_DATE() == null) {
           
           stModel.setSEAT_DATE(startDay[0]);
  		   
           session.setAttribute("seat_date", startDay[0]);
           
           List<seatModel> seatList = rvService.selectSeat2(stModel);
  		   
           System.out.println("size: "+seatList.size());
  		   mv.addObject("seatList", seatList);
  		   mv.setViewName("seatList");
  		   mv.addObject("ctDetail", ctDetail);
  		   mv.addObject("priceList", priceList);
  		   mv.setViewName("reservation");
         
         return mv;
         } else {
         
         stModel.setSEAT_CIDX(CULTURE_IDX);
         
         String SEAT_DATE = stModel.getSEAT_DATE();

         session.setAttribute("seat_date", SEAT_DATE);
         
         List<seatModel> avList = rvService.availableSeat(stModel);
         List<seatModel> seatList = rvService.selectSeat2(stModel);
         
         mv.addObject("seatList", seatList);
         mv.addObject("avList", avList);
         mv.addObject("ctDetail", ctDetail);
         mv.addObject("priceList", priceList);
         mv.setViewName("reservation");
         
         return mv;
         }    
      }
   
   @RequestMapping(value="/reserve/reservation.cul")
   public String reservation(HttpServletRequest request, HttpSession session, CultureModel ctModel, seatModel stModel, reserveModel rvModel) {
      ModelAndView mv = new ModelAndView();
      
      String sidx = request.getParameter("tsidx");
      String rvdate = (String)session.getAttribute("seat_date");
      System.out.println(rvdate);
      String id = "pray"/*(String)session.getAttribute("id")*/;
      int cidx = (int)(session.getAttribute("cidx"));
      session.setAttribute("Total", request.getParameter("Total"));
      session.setAttribute("sidx", sidx);
      session.setAttribute("seat_date", rvdate);
      session.setAttribute("id", id);
      
      String sidxAry[] = sidx.split(",");  
      
      for(int i = 0; i < sidxAry.length; i++) {
    	  rvModel.setRESERVE_SIDX((Integer.parseInt(sidxAry[i])));
    	  rvModel.setRESERVE_DATE(rvdate);
    	  rvModel.setRESERVE_ID(id);
    	  rvModel.setRESERVE_CIDX(cidx);
    	  
    	  System.out.println("1:"+rvModel.getRESERVE_CIDX());
    	  System.out.println("2:"+rvModel.getRESERVE_DATE());
    	  System.out.println("3:"+rvModel.getRESERVE_ID());
    	  System.out.println("4:"+rvModel.getRESERVE_SIDX());
    	 
    	  rvService.insertReserve(rvModel);
      }
      
      mv.setViewName("payForm");
      
      return "redirect:payForm.cul";
   }
   
   @RequestMapping(value="/reserve/payForm.cul")
   public ModelAndView payForm(HttpServletRequest request, HttpSession session, reserveModel rvModel, seatModel stModel) {
	   ModelAndView mv = new ModelAndView();
	   
	   List stName = new ArrayList<>();
	   
	   String sidx = (String)session.getAttribute("sidx");
	   System.out.println(session.getAttribute("seat_date"));
	   String seat_date = (String)session.getAttribute("seat_date");
	   String id = (String)session.getAttribute("id");
	   String Total = (String)session.getAttribute("Total");
	   
	   stModel.setSEAT_DATE(seat_date);
	   stModel.setSEAT_PRICE(Integer.parseInt(Total));
	   
	   String sidxAry[] = sidx.split(",");
	   
	   for(int i = 0; i < sidxAry.length; i++) {
		   stModel.setSEAT_IDX(Integer.parseInt(sidxAry[i]));

		   seatModel seat = rvService.seatName(stModel);

		   stName.add(seat.getSEAT_NAME());
		   rvService.seatReserve(stModel);
	   }
	   
	   mv.addObject("stModel", stModel);
	   mv.addObject("stName", stName);
	   mv.addObject("id", id);
	   mv.setViewName("payForm");

	   
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

   @RequestMapping(value="/reserve/reserveForm.cul")
   public ModelAndView reserveForm(HttpServletRequest request, HttpSession session, CultureModel ctModel, seatModel stModel) {
	  ModelAndView mv = new ModelAndView();	
      
      int CULTURE_IDX = (Integer.parseInt(request.getParameter("culture_idx")));
      
      stModel.setSEAT_DATE(request.getParameter("seat_date"));
      
      List priceList = new ArrayList();
      
      CultureModel ctDetail = cService.cultureDetail(CULTURE_IDX); 
      
      String area[] = ctDetail.getCULTURE_AREA().split(",");
      String price[] = ctDetail.getCULTURE_PRICE().split(",");
      
      for(int i = 0; i < area.length; i++) {
    	 priceList.add(area[i].concat(" : ").concat(price[i]));
      }
      
      if(stModel.getSEAT_DATE() != null) {
      
      stModel.setSEAT_CIDX(CULTURE_IDX);
      
      String SEAT_DATE = stModel.getSEAT_DATE();
      System.out.println(SEAT_DATE);
      session.setAttribute("SEAT_DATE", SEAT_DATE);
      
      List<seatModel> stList = rvService.availableSeat(stModel);
      
      mv.addObject("stList", stList);
      mv.addObject("ctDetail", ctDetail);
      mv.addObject("priceList", priceList);
      mv.setViewName("reserveForm");
      
      return mv;
      }
      mv.addObject("ctDetail", ctDetail);
      mv.addObject("priceList", priceList);
      mv.setViewName("reserveForm");
      
      return mv;
   }
   
   /*@ResponseBody
   @RequestMapping(value="/reserve/reserveForm", method=RequestMethod.POST )
   public Map<String, Object> changeDate(HttpServletRequest request, HttpSession session, CultureModel ctModel, seatModel stModel) {
	   Map<String, Object> map = new HashMap<String, Object>();
	   
	   int CULTURE_IDX = (int)session.getAttribute("cidx");
	   
	   stModel.setSEAT_DATE(request.getParameter("seat_date"));
	   
	   List<seatModel> stList = rvService.availableSeat(stModel);
	   
	   map.put("stListKey", stList);
	   
	   return map;
   }*/
   
   @RequestMapping(value="/reserve/seatList.cul")
   public ModelAndView seatList(HttpServletRequest request, HttpSession session, CultureModel ctModel, seatModel stModel) {
	   
   
	   ModelAndView mv = new ModelAndView();
	   
	   stModel.setSEAT_CIDX(Integer.parseInt(request.getParameter("culture_idx")));
	   stModel.setSEAT_DATE((String)session.getAttribute("SEAT_DATE"));
	   ctModel.setCULTURE_IDX(Integer.parseInt(request.getParameter("culture_idx")));
	   
	   String seat_date = (String)session.getAttribute("SEAT_NAME");
	   
	   List<CultureModel> dateList = rvService.selectDate(ctModel);
	   
	   if(stModel.getSEAT_DATE() == null) {
		   System.out.println("seat_date="+stModel.getSEAT_DATE());
		   List<seatModel> seatList = rvService.selectSeat1(stModel);
		   mv.addObject("seatList", seatList);
		   mv.addObject("dateList", dateList);
		   mv.setViewName("seatList");
		   
		   return mv;
	   } else {
	   List<seatModel> seatList = rvService.selectSeat2(stModel);
	   System.out.println("size: "+seatList.size());
	   mv.addObject("seatList", seatList);
	   mv.addObject("dateList", dateList);
	   mv.setViewName("seatList");
	   
	   return mv;
	   }
}
}
   