package culture.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import culture.member.evaluation.MemberModel;
import org.aopalliance.intercept.Interceptor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
public class ConcertInterceptor extends HandlerInterceptorAdapter{
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        
	        HttpSession session = request.getSession();
	        String memberModel = (String) session.getAttribute("id");
	 

	        if(memberModel == null){
	            response.sendRedirect("/culture/member/loginForm.cul");
	            return false;
	        }

	        
	        return true;
	    }
	 
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        // TODO Auto-generated method stub
	        super.postHandle(request, response, handler, modelAndView);
	    }
	 
	    @Override
	    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
	            throws Exception {
	        // TODO Auto-generated method stub
	        super.afterCompletion(request, response, handler, ex);
	    }
	 
	    
	    
	}