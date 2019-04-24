package yamoyeo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LogoController {
	
	@RequestMapping(value = "clickLogo.do")
	public void ClickLogo(HttpServletRequest request, HttpServletResponse response){
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		session.invalidate();
		HttpSession session2 = request.getSession();
		session2.setAttribute("user_id", user_id);
		Service service = new Service().getInstance();
		UserVO user = new UserDAO().searchUser(user_id);

		// Service
		ArrayList<GroupVO> list = service.recGroup(user.getInterest(), user.getAddress());

		// Output View
		if (list == null) {
			request.setAttribute("result", "가입된 모임이 없습니다.");
		}

		for (int i = 0; i < list.size(); i++) {
			try {
				session2.setAttribute(("group" + i), list.get(i));
				session2.setAttribute("image"+i, "groupImg/"+list.get(i).getImage());
			} catch (Exception e) {
				System.out.println("그룹부족");
				session2.setAttribute(("group" + i), null);
			}
		}
		
		// ========================================최근 모임, weekly 모임
		ArrayList<GroupVO> list2 = service.weeklyGroup();
		ArrayList<GroupVO> list3 = service.recentGroup();
		for(int i=0; i<list.size(); i++){
		session2.setAttribute("weeklyGroup"+i, list2.get(i));
		session2.setAttribute("weekimage"+i, "groupImg/"+list2.get(i).getImage());
		session2.setAttribute("recentGroup"+i, list3.get(i));
		session2.setAttribute("recentimage"+i, "groupImg/"+list3.get(i).getImage());
		}
		System.out.println(list);
		System.out.println(list2);
		System.out.println(list3);
		
		

		// =========================================페이지 이동
		HttpUtil.forward(request, response, "/view02_d.jsp");
		
		
	}
	
}
