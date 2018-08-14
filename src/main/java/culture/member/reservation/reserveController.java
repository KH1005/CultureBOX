package culture.member.reservation;

import java.util.ArrayList;
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
import culture.member.reservation.reserveBean;
import culture.member.reservation.seatBean;

@Controller
public class reserveController  {

	String id;
	int cidx;
	int culture_idx;
	
	@Resource
	private reserveService rvService;
	
	@RequestMapping(value="/reserve/reservationForm.box")
	public ModelAndView reservation(HttpServletRequest request, HttpSession session, seatBean stBean, reserveBean rvBean) {
		ModelAndView mv = new ModelAndView();
		ArrayList<Object> seat = new ArrayList<Object>();
		ArrayList<Object> reserve = new ArrayList<Object>();
		int seat_cnt = 0;
		
		seat_cnt = Integer.parseInt(request.getParameter("seat_cnt"));
		
	/*	if(session.getAttribute(id) == null) {
			mv.setViewName("/member/LoginForm.box");	
			return mv;
		}*/
		
		if(seat_cnt >= 1) {
		for(int i = 0; i <= seat_cnt; i++) {
		stBean.setSEAT_AREA(request.getParameter("seatArea"));
		stBean.setSEAT_NUMBER(Integer.parseInt(request.getParameter("seatNumber")));
		stBean.setSEAT_PRICE(Integer.parseInt(request.getParameter("seatPrice")));
		stBean.setSEAT_DATE(request.getParameter("seatDate"));
		rvBean.setRESERVE_ID((String)session.getAttribute(id));
		rvBean.setRESERVE_CIDX((int)session.getAttribute("cidx"));
		rvBean.setRESERVE_DATE(request.getParameter("seatDate"));
		seat.add(stBean);
		reserve.add(rvBean);
			}
		}
		for(int t = 0; t <= seat.size(); t++) {
		stBean = (seatBean)seat.get(t);
		rvService.insertSeat(stBean);
		}
		for(int l = 0; l <= reserve.size(); l++) {
		rvBean = (reserveBean)seat.get(l);
		rvService.insertReserve(rvBean);
		}
		
		mv.setViewName("/reserve/payForm.box");
		
		return mv;
	}
	
	@RequestMapping(value="/reserve/payForm.box", method=RequestMethod.GET)
	public ModelAndView payForm(HttpServletRequest request, HttpSession session, seatBean stBean, reserveBean rvBean) {
		ModelAndView mv = new ModelAndView();
		/*
		if(session.getAttribute(id) == null) {
			mv.setViewName("Login.box");
			
			return mv;
		}
		*/
		rvBean.setRESERVE_ID((String)session.getAttribute("id"));
		rvBean.setRESERVE_CIDX((int)session.getAttribute("cidx"));
		
		rvService.selectSeat(rvBean);
		
		return mv;
	}
	
	@RequestMapping(value="/reserve/payForm.box", method=RequestMethod.POST)
	public ModelAndView pay(HttpServletRequest request, seatBean stBean) {
		ModelAndView mv = new ModelAndView();
		
		rvService.updateReserveSeat(stBean);
		
		mv.setViewName("/reserve/payComplete.box");
		
		return mv;
	}
	
	@RequestMapping(value="/reserve/payComplete.box", method=RequestMethod.GET)
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